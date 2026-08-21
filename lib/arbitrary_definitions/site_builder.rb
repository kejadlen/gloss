# frozen_string_literal: true

require "yaml"
require "erb"
require "fileutils"
require "time"

# The site is UTF-8 regardless of the locale the build happens to run under;
# a runner with LANG unset would otherwise read the Markdown as US-ASCII.
Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8
require "kramdown"
require "kramdown-parser-gfm"

require_relative "token_set"
require_relative "dot"
require_relative "page_context"

module ArbitraryDefinitions
  # The whole static site build: reads `_config.yml` and `_data/`, compiles
  # the tokens and Sass, renders every Markdown page through ERB and then
  # Kramdown, wraps it in its layout, and writes the result under `_site/`.
  #
  # This replaces Jekyll itself, not just its plugins — `Rakefile`'s `build`
  # task is the only caller.
  class SiteBuilder
    ROOT        = File.expand_path("../..", __dir__)
    SITE_DIR    = File.join(ROOT, "_site")
    LAYOUTS_DIR = File.join(ROOT, "_layouts")
    SASS_DIR    = File.join(ROOT, "_sass")

    # dir under repository root => [permalink pattern, default section]
    COLLECTIONS = {
      "_foundations" => ["/foundations/%s/", "Foundations"],
      "_components"  => ["/components/%s/", "Components"],
      "_patterns"    => ["/patterns/%s/", "Patterns"],
    }.freeze

    # Top-level content pages. README.md is deliberately left out, matching
    # _config.yml's old `exclude:` list — it documents the repository, not
    # the design system, and was never rendered as a site page.
    TOP_LEVEL_PAGES = %w[index.md install.md rationale.md].freeze

    PageSource = Struct.new(:front_matter, :body, :url, :layout, :section, keyword_init: true)

    def initialize
      @config    = YAML.safe_load_file(File.join(ROOT, "_config.yml"))
      @token_set = TokenSet.new(dir: File.join(ROOT, "_data", "tokens"),
                                 prefix: @config.fetch("token_prefix", "ad"))
      @site      = build_site
    end

    def build
      FileUtils.rm_rf(SITE_DIR)
      FileUtils.mkdir_p(SITE_DIR)

      write_tokens_css
      compile_sass
      copy_assets
      collect_pages.each { |page_source| render_page(page_source) }
    end

    private

    def build_site
      nav  = YAML.safe_load_file(File.join(ROOT, "_data", "nav.yml"))
      meta = YAML.safe_load_file(File.join(ROOT, "_data", "meta.yml"))

      component_names = Dir.glob(File.join(ROOT, "_components", "*.md")).map { |path| File.basename(path, ".md") }

      data = {
        "meta" => meta,
        "nav" => nav,
        "tokens" => {
          "color" => { "ramps" => @token_set.ramps },
          "semantic" => { "groups" => @token_set.semantic },
          "scale" => @token_set.scale,
          "contrast" => @token_set.contrast,
        },
        "semantic_flat" => @token_set.semantic_tokens,
        "tokens_css_size" => @token_set.to_css.bytesize,
        "build" => {
          "ruby" => RUBY_VERSION,
          "ramps" => @token_set.ramps.size,
          "aliases" => @token_set.semantic_tokens.size,
          "generated_at" => Time.now.utc.strftime("%Y-%m-%d"),
        },
      }

      Site.new(
        title: @config.fetch("title"),
        tagline: @config["tagline"],
        description: @config["description"],
        url: @config["url"],
        baseurl: @config.fetch("baseurl", ""),
        repository: @config["repository"],
        lang: @config.fetch("lang", "en"),
        token_prefix: @token_set.prefix,
        components: component_names,
        data: Dot.wrap(data),
      )
    end

    Site = Struct.new(:title, :tagline, :description, :url, :baseurl, :repository, :lang,
                       :token_prefix, :components, :data, keyword_init: true)

    def write_tokens_css
      write(File.join(SITE_DIR, "assets", "css", "tokens.css"), @token_set.to_css)
    end

    def compile_sass
      require "sass-embedded"

      source = File.read(File.join(ROOT, "assets", "css", "style.scss"))
      result = Sass.compile_string(source, load_paths: [SASS_DIR], style: :compressed)
      write(File.join(SITE_DIR, "assets", "css", "style.css"), result.css)
    end

    def copy_assets
      FileUtils.mkdir_p(File.join(SITE_DIR, "assets", "js"))
      FileUtils.cp(File.join(ROOT, "assets", "favicon.svg"), File.join(SITE_DIR, "assets", "favicon.svg"))
      Dir.glob(File.join(ROOT, "assets", "js", "*")).each do |path|
        FileUtils.cp(path, File.join(SITE_DIR, "assets", "js", File.basename(path)))
      end
    end

    def collect_pages
      pages = []

      TOP_LEVEL_PAGES.each do |filename|
        front_matter, body = split_front_matter(File.read(File.join(ROOT, filename)))
        default_url = filename == "index.md" ? "/" : "/#{File.basename(filename, '.md')}/"

        pages << PageSource.new(
          front_matter: front_matter,
          body: body,
          url: front_matter.fetch("permalink", default_url),
          layout: front_matter.fetch("layout", "page"),
          section: front_matter["section"],
        )
      end

      COLLECTIONS.each do |dir, (permalink_pattern, default_section)|
        Dir.glob(File.join(ROOT, dir, "*.md")).sort.each do |path|
          front_matter, body = split_front_matter(File.read(path))
          name = File.basename(path, ".md")

          pages << PageSource.new(
            front_matter: front_matter,
            body: body,
            url: format(permalink_pattern, name),
            layout: front_matter.fetch("layout", "page"),
            section: front_matter.fetch("section", default_section),
          )
        end
      end

      pages
    end

    # A page that wants to *show* `<%= ... %>` syntax as documentation text —
    # `install.md` demonstrating the `example` helper — needs it kept out of
    # ERB's own evaluation, the same job Liquid's `{% raw %}` used to do.
    # `<!--verbatim--> ... <!--/verbatim-->` marks such a span; its contents
    # are stashed before the ERB pass and spliced back in afterwards.
    VERBATIM = /<!--verbatim-->(.*?)<!--\/verbatim-->/m

    def extract_verbatim(body)
      blocks = []
      protected_body = body.gsub(VERBATIM) do
        blocks << Regexp.last_match(1)
        " VERBATIM#{blocks.size - 1} "
      end
      [protected_body, blocks]
    end

    def restore_verbatim(text, blocks)
      text.gsub(/ VERBATIM(\d+) /) { blocks[Regexp.last_match(1).to_i] }
    end

    def split_front_matter(raw)
      match = raw.match(/\A---\s*\n(.*?)\n---\s*\n(.*)\z/m)
      raise "no front matter found" unless match

      [(YAML.safe_load(match[1]) || {}), match[2]]
    end

    def render_page(page_source)
      page = Dot.wrap(page_source.front_matter.merge(
        "url" => page_source.url,
        "section" => page_source.section,
      ))

      context = PageContext.new(site: @site, page: page)

      protected_body, verbatim_blocks = extract_verbatim(page_source.body)
      rendered = ERB.new(protected_body, trim_mode: "-").result(context.erb_binding)
      rendered = restore_verbatim(rendered, verbatim_blocks)

      html_body = Kramdown::Document.new(
        rendered,
        input: "GFM",
        syntax_highlighter: "rouge",
        syntax_highlighter_opts: { default_lang: "html" },
      ).to_html

      html = wrap_layout(page_source.layout, html_body, context)
      write(File.join(output_dir(page_source.url), "index.html"), html)
    end

    def output_dir(url)
      relative = url.sub(%r{\A/}, "").sub(%r{/\z}, "")
      relative.empty? ? SITE_DIR : File.join(SITE_DIR, relative)
    end

    # Layouts may themselves declare a `layout:` in their own front matter
    # (`_layouts/page.erb` wraps in `default`), so this recurses outward
    # until a layout with no further parent is reached.
    def wrap_layout(name, content, context)
      return content if name.nil? || name == "none"

      raw = File.read(File.join(LAYOUTS_DIR, "#{name}.erb"))
      front_matter, body =
        if raw.start_with?("---\n")
          split_front_matter(raw)
        else
          [{}, raw]
        end

      context.content = content
      rendered = ERB.new(body, trim_mode: "-").result(context.erb_binding)

      wrap_layout(front_matter["layout"], rendered, context)
    end

    def write(path, content)
      FileUtils.mkdir_p(File.dirname(path))
      File.write(path, content)
    end
  end
end
