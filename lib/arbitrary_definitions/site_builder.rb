# frozen_string_literal: true

require "yaml"
require "erb"
require "fileutils"

# The site is UTF-8 regardless of the locale the build happens to run under;
# a runner with LANG unset would otherwise read the Markdown as US-ASCII.
Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8
require "kramdown"
require "kramdown-parser-gfm"

require_relative "dot"
require_relative "page_context"

module ArbitraryDefinitions
  # The whole static site build: reads `_config.yml` and `_data/`, concatenates
  # the plain CSS under `_sass/` and copies `assets/css/tokens.css`, renders
  # every Markdown page through ERB and then Kramdown, wraps it in its layout,
  # and writes the result under `_site/`.
  #
  # This replaces Jekyll itself, not just its plugins — `Rakefile`'s `build`
  # task is the only caller.
  class SiteBuilder
    ROOT        = File.expand_path("../..", __dir__)
    SITE_DIR    = File.join(ROOT, "_site")
    LAYOUTS_DIR = File.join(ROOT, "_layouts")
    SASS_DIR    = File.join(ROOT, "_sass")

    # Plain CSS files, concatenated in this order into assets/css/style.css:
    # reset/base first, then components, then this site's own chrome.
    CSS_FILES = %w[
      base/reset.css
      base/typography.css
      components/button.css
      components/field.css
      components/badge.css
      components/card.css
      components/feedback.css
      components/tabs.css
      site/shell.css
      site/example.css
      site/tokens-docs.css
    ].freeze

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
      @config = YAML.safe_load_file(File.join(ROOT, "_config.yml"))
      @site   = build_site
    end

    def build
      FileUtils.rm_rf(SITE_DIR)
      FileUtils.mkdir_p(SITE_DIR)

      write_css
      copy_assets
      collect_pages.each { |page_source| render_page(page_source) }
    end

    private

    def build_site
      Site.new(
        title: @config.fetch("title"),
        tagline: @config["tagline"],
        description: @config["description"],
        url: @config["url"],
        baseurl: @config.fetch("baseurl", ""),
        repository: @config["repository"],
        lang: @config.fetch("lang", "en"),
        data: Dot.wrap(
          "nav" => YAML.safe_load_file(File.join(ROOT, "_data", "nav.yml")),
          "meta" => YAML.safe_load_file(File.join(ROOT, "_data", "meta.yml")),
        ),
      )
    end

    Site = Struct.new(:title, :tagline, :description, :url, :baseurl, :repository, :lang, :data, keyword_init: true)

    def write_css
      css = CSS_FILES.map { |name| File.read(File.join(SASS_DIR, name)) }.join("\n")
      write(File.join(SITE_DIR, "assets", "css", "style.css"), css)

      tokens_out = File.join(SITE_DIR, "assets", "css", "tokens.css")
      FileUtils.mkdir_p(File.dirname(tokens_out))
      FileUtils.cp(File.join(ROOT, "assets", "css", "tokens.css"), tokens_out)
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

      rendered = ERB.new(page_source.body, trim_mode: "-").result(context.erb_binding)

      # hard_wrap: false — the GFM parser otherwise turns every manually
      # word-wrapped source line into a <br>, since GitHub's own comment
      # rendering treats a single newline as a line break. This content is
      # wrapped for editor readability, not for literal line breaks.
      html_body = Kramdown::Document.new(rendered, input: "GFM", syntax_highlighter: nil, hard_wrap: false).to_html

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
