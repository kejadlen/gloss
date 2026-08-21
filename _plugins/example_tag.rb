# frozen_string_literal: true

require "cgi/escape"
require "rouge"

module ArbitraryDefinitions
  # {% example title="Variants" align="center" %} ... {% endexample %}
  #
  # Renders the block twice: once live, so the reader sees the component the
  # browser actually paints, and once as highlighted source, so they can copy
  # the exact markup. Writing the demo and the snippet separately is how
  # design system docs start lying; this makes that impossible.
  #
  # Options
  #   title="…"     caption above the preview
  #   align=…       start | center | end   (default start)
  #   surface=…     canvas | sunken | plain  (default canvas)
  #   layout=…      row | stack | grid      (default row)
  #   open          expand the source panel on load
  #   no-source     preview only, for demos whose markup is noise
  class ExampleTag < Liquid::Block
    OPTION = /(\w[\w-]*)(?:=(?:"([^"]*)"|'([^']*)'|(\S+)))?/

    ALIGNMENTS = %w[start center end].freeze
    SURFACES   = %w[canvas sunken plain].freeze
    LAYOUTS    = %w[row stack grid].freeze

    def initialize(tag_name, markup, tokens)
      super
      @options = parse_options(markup)
    end

    def render(context)
      source = dedent(super.to_s)
      return "" if source.strip.empty?

      preview = <<~HTML.strip
        <div class="ad-example__preview #{preview_classes}">#{source}</div>
      HTML

      parts = []
      parts << %(<figure class="ad-example">)
      parts << %(<figcaption class="ad-example__title">#{escape(@options['title'])}</figcaption>) if @options["title"]
      parts << preview
      parts << source_panel(source) unless @options.key?("no-source")
      parts << "</figure>"
      parts.join("\n")
    end

    private

    def preview_classes
      align   = ALIGNMENTS.include?(@options["align"]) ? @options["align"] : "start"
      surface = SURFACES.include?(@options["surface"]) ? @options["surface"] : "canvas"
      layout  = LAYOUTS.include?(@options["layout"]) ? @options["layout"] : "row"

      "ad-example__preview--#{align} ad-example__preview--#{surface} ad-example__preview--#{layout}"
    end

    def source_panel(source)
      lexer     = Rouge::Lexers::HTML.new
      formatter = Rouge::Formatters::HTML.new
      highlighted = formatter.format(lexer.lex(source))

      <<~HTML.strip
        <details class="ad-example__source"#{@options.key?('open') ? ' open' : ''}>
        <summary class="ad-example__summary"><span>Markup</span></summary>
        <div class="ad-example__code highlight">
        <button type="button" class="ad-example__copy" data-copy aria-label="Copy markup to clipboard">Copy</button>
        <pre><code class="language-html">#{highlighted}</code></pre>
        </div>
        </details>
      HTML
    end

    # Liquid hands back the block body with whatever indentation the Markdown
    # file used. Strip the common prefix so the copied snippet is not
    # accidentally nested four levels deep.
    def dedent(text)
      lines  = text.sub(/\A\n+/, "").rstrip.lines
      widths = lines.reject { |line| line.strip.empty? }
                    .map { |line| line[/\A[ \t]*/].length }
      indent = widths.min || 0

      lines.map { |line| line.strip.empty? ? line.lstrip : line[indent..] }.join
    end

    def parse_options(markup)
      markup.to_s.scan(OPTION).each_with_object({}) do |(key, dq, sq, bare), options|
        options[key] = dq || sq || bare || true
      end
    end

    def escape(value)
      CGI.escapeHTML(value.to_s)
    end
  end
end

Liquid::Template.register_tag("example", ArbitraryDefinitions::ExampleTag)
