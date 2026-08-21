#!/usr/bin/env ruby
# frozen_string_literal: true

# Builds the Claude Design upload bundle from the already-built _site.
#
# One card per documentation page: the page's <main> lifted out of the site
# chrome and dropped into a standalone HTML file with the compiled tokens and
# component CSS inlined. Cards are generated rather than hand-written for the
# same reason the docs are — a second, hand-maintained copy of the system would
# start disagreeing with the first one immediately.
#
#   bundle exec jekyll build && ruby script/build_design_bundle.rb
#
# Output lands in design-bundle/, which is gitignored: it is a build artifact.

require "fileutils"

# The site is UTF-8 regardless of the locale the build happens to run under,
# and a runner with LANG unset would otherwise read it as US-ASCII.
Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8

ROOT   = File.expand_path("..", __dir__)
SITE   = File.join(ROOT, "_site")
OUT    = File.join(ROOT, "design-bundle")
BASE   = "/arbitrary-definitions-design-system"
CANON  = "https://kejadlen.github.io#{BASE}"

# page path in _site => [bundle path, Design System pane group, card title]
CARDS = [
  ["foundations/color",       "foundations/color.html",       "Foundations", "Colour"],
  ["foundations/typography",  "foundations/typography.html",  "Foundations", "Typography"],
  ["foundations/space",       "foundations/space.html",       "Foundations", "Space"],
  ["foundations/elevation",   "foundations/elevation.html",   "Foundations", "Elevation"],
  ["foundations/motion",      "foundations/motion.html",      "Foundations", "Motion"],
  ["components/button",       "components/button.html",       "Components",  "Button"],
  ["components/field",        "components/field.html",        "Components",  "Field"],
  ["components/badge",        "components/badge.html",        "Components",  "Badge"],
  ["components/callout",      "components/callout.html",      "Components",  "Callout"],
  ["components/card",         "components/card.html",         "Components",  "Card"],
  ["components/table",        "components/table.html",        "Components",  "Table"],
  ["components/tabs",         "components/tabs.html",         "Components",  "Tabs"],
  ["components/progress",     "components/progress.html",     "Components",  "Progress"],
  ["patterns/settings-form",  "patterns/settings-form.html",  "Patterns",    "Settings form"],
  ["patterns/kitchen-sink",   "patterns/kitchen-sink.html",   "Patterns",    "Kitchen sink"],
].freeze

def read_site(path)
  full = File.join(SITE, path)
  abort "missing #{full} — run `bundle exec jekyll build` first" unless File.file?(full)
  File.read(full, encoding: "UTF-8")
end

# The site emits exactly one <main>, with no nesting, so this is unambiguous.
def extract_main(html, page)
  body = html[%r{<main[^>]*id="main"[^>]*>(.*?)</main>}m, 1]
  abort "no <main> found in #{page}" unless body

  body
    # Site-relative links would dead-end inside the Design System pane.
    .gsub(%r{(href|src)="#{Regexp.escape(BASE)}/}, "\\1=\"#{CANON}/")
    # The copy button needs the site's clipboard handler; without it the
    # control is a lie, so the card ships without it.
    .gsub(%r{<button[^>]*data-copy[^>]*>.*?</button>}m, "")
    .strip
end

def card_html(group:, title:, body:, tokens:, styles:, script:)
  <<~HTML
    <!-- @dsCard group="#{group}" -->
    <!doctype html>
    <html lang="en">
    <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>#{title}</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Fraunces:opsz,wght@9..144,500;9..144,600&family=Inter:wght@400;500;600;700&family=JetBrains+Mono:wght@400;500&display=swap">
    <style>
    #{tokens}
    #{styles}
    /* Card chrome. The pane supplies the frame; this just insets the page. */
    body { padding: var(--ad-space-6) var(--ad-space-5); }
    .ad-doc-main { max-width: var(--ad-width-content); margin-inline: auto; }
    .ad-doc-main > * { max-width: none; }
    </style>
    </head>
    <body>
    <main class="ad-doc-main">
    #{body}
    </main>
    <script>
    #{script}
    </script>
    </body>
    </html>
  HTML
end

FileUtils.rm_rf(OUT)
FileUtils.mkdir_p(OUT)

tokens = read_site("assets/css/tokens.css")
styles = read_site("assets/css/style.css")
script = read_site("assets/js/system.js")

# The compiled CSS goes in as-is too, so the project carries the artifact a
# consumer would actually link, not only the rendered previews.
FileUtils.mkdir_p(File.join(OUT, "css"))
File.write(File.join(OUT, "css", "tokens.css"), tokens)
File.write(File.join(OUT, "css", "style.css"), styles)

CARDS.each do |page, out_path, group, title|
  body = extract_main(read_site(File.join(page, "index.html")), page)
  target = File.join(OUT, out_path)
  FileUtils.mkdir_p(File.dirname(target))
  File.write(target, card_html(group: group, title: title, body: body,
                               tokens: tokens, styles: styles, script: script))
end

total = Dir.glob(File.join(OUT, "**", "*")).count { |f| File.file?(f) }
bytes = Dir.glob(File.join(OUT, "**", "*")).sum { |f| File.file?(f) ? File.size(f) : 0 }
puts "design-bundle: #{CARDS.size} cards, #{total} files, #{(bytes / 1024.0).round} KiB"
