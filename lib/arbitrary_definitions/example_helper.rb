# frozen_string_literal: true

require "cgi/escape"
require "rouge"

module ArbitraryDefinitions
  # `<%= example(title: "Variants", align: :center, ...) do %> ... <% end %>`
  #
  # Renders its block twice: once live, so the reader sees the component the
  # browser actually paints, and once as highlighted source, so they can copy
  # the exact markup. Writing the demo and the snippet separately is how
  # design system docs start lying; this makes that impossible.
  #
  # This is the same logic that used to live in the Liquid `{% example %}`
  # block (`_plugins/example_tag.rb`) — ported to a plain method that takes
  # real keyword arguments and captures a real ERB block, since there is no
  # Liquid markup string to parse any more.
  #
  # Options
  #   title: "…"            caption above the preview
  #   align: "start"|"center"|"end"      (default "start")
  #   surface: "canvas"|"sunken"|"plain" (default "canvas")
  #   layout: "row"|"stack"|"grid"       (default "row")
  #   open: true             expand the source panel on load
  #   no_source: true        preview only, for demos whose markup is noise
  module ExampleHelper
    ALIGNMENTS = %w[start center end].freeze
    SURFACES   = %w[canvas sunken plain].freeze
    LAYOUTS    = %w[row stack grid].freeze

    # Called as `<% example(...) do %> ... <% end %>` — a statement, not
    # `<%= ... %>`, because stock ERB (unlike Rails' Erubi) cannot compile an
    # interpolated expression whose `do ... end` block spans template tags:
    # the `<%=` tag closes its own `(...)` before the block body appears, so
    # `_erbout << (example(...) do ).to_s` is what ERB would generate and it
    # is a syntax error. Instead this writes its result directly into the
    # same output buffer `capture` already knows how to reach.
    def example(title: nil, align: nil, surface: nil, layout: nil, open: false, no_source: false, &block)
      buffer = eval("_erbout", block.binding)
      source = dedent(capture(&block).to_s)
      return if source.strip.empty?

      preview = <<~HTML.strip
        <div class="ad-example__preview #{preview_classes(align, surface, layout)}">#{source}</div>
      HTML

      parts = []
      parts << %(<figure class="ad-example">)
      parts << %(<figcaption class="ad-example__title">#{escape_html(title)}</figcaption>) if title
      parts << preview
      parts << source_panel(source, open: open) unless no_source
      parts << "</figure>"

      buffer << parts.join("\n")
      nil
    end

    # The well-known manual-capture pattern for plain ERB: the output buffer
    # is a local variable (`_erbout`, ERB's default `eoutvar`) in whatever
    # binding the surrounding template is being evaluated in, and a block
    # literal written inside that template shares that same binding — so
    # reaching into it lets a helper method capture exactly what its block
    # wrote, the way Rails' `capture` does without Rails.
    def capture(&block)
      buffer = eval("_erbout", block.binding)
      pos = buffer.length
      block.call
      result = buffer[pos..]
      buffer.slice!(pos..)
      result
    end

    private

    def preview_classes(align, surface, layout)
      align   = ALIGNMENTS.include?(align.to_s) ? align.to_s : "start"
      surface = SURFACES.include?(surface.to_s) ? surface.to_s : "canvas"
      layout  = LAYOUTS.include?(layout.to_s) ? layout.to_s : "row"

      "ad-example__preview--#{align} ad-example__preview--#{surface} ad-example__preview--#{layout}"
    end

    def source_panel(source, open:)
      lexer       = Rouge::Lexers::HTML.new
      formatter   = Rouge::Formatters::HTML.new
      highlighted = formatter.format(lexer.lex(source))

      <<~HTML.strip
        <details class="ad-example__source"#{open ? ' open' : ''}>
        <summary class="ad-example__summary"><span>Markup</span></summary>
        <div class="ad-example__code highlight">
        <button type="button" class="ad-example__copy" data-copy aria-label="Copy markup to clipboard">Copy</button>
        <pre><code class="language-html">#{highlighted}</code></pre>
        </div>
        </details>
      HTML
    end

    # The captured block body carries whatever indentation the Markdown file
    # used. Strip the common prefix so the copied snippet is not accidentally
    # nested four levels deep.
    def dedent(text)
      lines  = text.sub(/\A\n+/, "").rstrip.lines
      widths = lines.reject { |line| line.strip.empty? }
                    .map { |line| line[/\A[ \t]*/].length }
      indent = widths.min || 0

      lines.map { |line| line.strip.empty? ? line.lstrip : line[indent..] }.join
    end

    def escape_html(value)
      CGI.escapeHTML(value.to_s)
    end
  end
end
