# frozen_string_literal: true

# The whole site build. Not a framework — this is one specific site with
# ~25 known pages, so it lists them and builds them, rather than porting
# Jekyll's generic machinery (collections, permalink patterns, layout
# inheritance, a Liquid-like dotted-hash type, includes-with-locals) into
# Ruby. Adding a page means adding a line to PAGES or a file to one of the
# three content directories below; nothing here needs to get more generic
# than that to do its job.

require "yaml"
require "erb"
require "fileutils"
require "cgi/escape"

# A runner with LANG unset would otherwise read the Markdown as US-ASCII.
Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8

require "kramdown"
require "kramdown-parser-gfm"

ROOT    = File.expand_path("..", __dir__)
SITE    = File.join(ROOT, "_site")
NAV     = YAML.safe_load_file(File.join(ROOT, "_data", "nav.yml"))
VERSION = "2.0.0"

# This is one specific site, deployed to one specific place — these aren't
# going to vary per environment, so they're constants rather than a config
# file to load. (The previous _config.yml also carried a `tagline` key
# nothing ever rendered — a small config file with a dead entry is exactly
# the kind of thing that's easy to miss when it's not just a constant.)
TITLE       = "Gloss"
DESCRIPTION = "Gloss is the design system for Arbitrary Definitions, a personal " \
              "umbrella of self-hosted, single-user tools. Sixteen components and five " \
              "foundations, built with a small Ruby/ERB site builder running on Ruby 4.0."
SITE_URL    = "https://kejadlen.github.io"
BASEURL     = "/gloss"
REPOSITORY  = "kejadlen/gloss"
LANG        = "en"

# Plain CSS files, concatenated into one output bundle per named group
# (assets/css/<name>.css) rather than one monolithic style.css — a
# consumer using this system elsewhere links tokens.css + base.css +
# components.css and gets none of docs.css (this documentation site's own
# chrome) or patterns.css (Loop/Archive's page-specific CSS, useful only
# as a worked example). This site itself links all four, in this order.
CSS_BUNDLES = {
  "base" => %w[base/reset.css base/typography.css],
  "components" => %w[
    components/button.css
    components/field.css
    components/badge.css
    components/card.css
    components/feedback.css
    components/tabs.css
  ],
  "docs" => %w[site/shell.css site/example.css site/tokens-docs.css],
  "patterns" => %w[site/patterns.css],
}.freeze
CSS_BUNDLE_ORDER = %w[base components docs patterns].freeze

# [source file (absolute or relative to ROOT), url, section label for the
# doc-title header (nil to omit it entirely — index.md builds its own hero
# markup and has no h1 header)].
PAGES = [
  ["index.md", "/", nil],
  ["rationale.md", "/rationale/", nil],
  ["install.md", "/install/", nil],
  *Dir[File.join(ROOT, "_foundations/*.md")].sort.map { |f| [f, "/foundations/#{File.basename(f, ".md")}/", "Foundations"] },
  *Dir[File.join(ROOT, "_components/*.md")].sort.map { |f| [f, "/components/#{File.basename(f, ".md")}/", "Components"] },
  *Dir[File.join(ROOT, "_patterns/*.md")].sort.map { |f| [f, "/patterns/#{File.basename(f, ".md")}/", "Patterns"] },
].map { |source, url, section| [File.expand_path(source, ROOT), url, section] }.freeze

# Prefixes `baseurl` onto a path, without doubling slashes. Used both by
# page bodies (a handful link to other pages) and the layout.
def relative_url(path)
  path = "/#{path}" unless path.start_with?("/")
  "#{BASEURL.chomp("/")}#{path}"
end

def escape(value) = CGI.escapeHTML(value.to_s)

def split_front_matter(raw)
  raw =~ /\A---\s*\n(.*?)\n---\s*\n(.*)\z/m or raise "no front matter found"
  [YAML.safe_load(::Regexp.last_match(1)) || {}, ::Regexp.last_match(2)]
end

def render_shell(title:, description:, url:, body:)
  template = File.read(File.join(ROOT, "_layouts", "page.erb"))
  ERB.new(template, trim_mode: "-").result(binding)
end

def render_page(source_path, url, section)
  front, markdown = split_front_matter(File.read(source_path))

  content = ERB.new(markdown, trim_mode: "-").result(binding)
  # hard_wrap: false — the GFM parser otherwise turns every manually
  # word-wrapped source line into a <br>, since GitHub's own comment
  # rendering treats a single newline as a line break. This content is
  # wrapped for editor readability, not for literal line breaks.
  content_html = Kramdown::Document.new(content, input: "GFM", syntax_highlighter: nil, hard_wrap: false).to_html

  # index.md sets `layout: default` to skip the auto title header and build
  # its own hero markup instead; every other page gets one generated here.
  body =
    if front["layout"] == "default"
      content_html
    else
      title_header = section ? %(<span class="gl-doc-title__section">#{section}</span>) : ""
      summary = front["summary"] ? %(<p class="gl-lead">#{front["summary"]}</p>\n) : ""
      <<~HTML
        <header class="gl-doc-title">#{title_header}
          <h1>#{front.fetch("title")}</h1>
        </header>
        #{summary}#{content_html}
      HTML
    end

  html = render_shell(
    title: front.fetch("title"),
    description: front["description"] || front["summary"] || DESCRIPTION,
    url: url,
    body: body,
  )

  out_dir = url == "/" ? SITE : File.join(SITE, url.delete_prefix("/").delete_suffix("/"))
  FileUtils.mkdir_p(out_dir)
  File.write(File.join(out_dir, "index.html"), html)
end

def write_css
  out_dir = File.join(SITE, "assets", "css")
  FileUtils.mkdir_p(out_dir)

  CSS_BUNDLES.each do |bundle_name, files|
    css = files.map { |name| File.read(File.join(ROOT, "_sass", name)) }.join("\n")
    File.write(File.join(out_dir, "#{bundle_name}.css"), css)
  end

  FileUtils.cp(File.join(ROOT, "assets", "css", "tokens.css"), File.join(out_dir, "tokens.css"))
end

def copy_assets
  FileUtils.mkdir_p(File.join(SITE, "assets", "js"))
  FileUtils.cp(File.join(ROOT, "assets", "favicon.svg"), File.join(SITE, "assets", "favicon.svg"))
  Dir[File.join(ROOT, "assets", "js", "*")].each { |path| FileUtils.cp(path, File.join(SITE, "assets", "js", File.basename(path))) }
end

def build
  FileUtils.rm_rf(SITE)
  FileUtils.mkdir_p(SITE)
  write_css
  copy_assets
  PAGES.each { |source, url, section| render_page(source, url, section) }
end
