# frozen_string_literal: true

require "cgi/escape"
require "erb"
require_relative "color_math"
require_relative "example_helper"

module ArbitraryDefinitions
  # Everything an ERB template can reach: `site`/`page` data (standing in for
  # Liquid's `{{ site.* }}` / `{{ page.* }}`), the colour-maths helpers that
  # used to be Liquid filters (`_plugins/color_filters.rb`), `relative_url`
  # (Jekyll's `relative_url` filter), `render` for includes/partials, and the
  # `example` block helper (`_plugins/example_tag.rb`).
  #
  # One instance is built per page and reused for every layout and partial
  # that page passes through, so `page`/`site` stay consistent from the
  # innermost content template out through every wrapping layout.
  class PageContext
    include ExampleHelper

    attr_accessor :site, :page, :content

    def initialize(site:, page: nil, content: nil)
      @site = site
      @page = page
      @content = content
    end

    # A fresh `binding` on every call, with `self` fixed to this context, so
    # each ERB evaluation (the page body, each layout it wraps in, every
    # partial) gets its own `_erbout` output buffer while still resolving
    # `site`, `page`, `content`, and every helper below as plain method calls.
    def erb_binding
      binding
    end

    # Stands in for Jekyll's `relative_url` filter: prefixes `baseurl`,
    # without doubling slashes.
    def relative_url(path)
      path = path.to_s
      path = "/#{path}" unless path.start_with?("/")
      "#{site.baseurl.to_s.chomp('/')}#{path}"
    end

    # -- former Liquid filters in _plugins/color_filters.rb -----------------

    def contrast_with(value, other)
      ratio = ColorMath.contrast_ratio(value, other)
      return "—" unless ratio

      format("%.2f", ratio)
    end

    def contrast_grade(value, other)
      ColorMath.grade(ColorMath.contrast_ratio(value, other))
    end

    def readable_on(value)
      ColorMath.readable_on(value)
    end

    def luminance_percent(value)
      luminance = ColorMath.relative_luminance(value)
      return "—" unless luminance

      (luminance * 100).round
    end

    def hex_color?(value)
      ColorMath.hex?(value)
    end

    def custom_property(value)
      "--#{site.token_prefix}-#{value}"
    end

    def escape(value)
      CGI.escapeHTML(value.to_s)
    end

    # -- includes -------------------------------------------------------

    INCLUDES_DIR = File.expand_path("../../_includes", __dir__)

    # Stands in for `{% include name.html %}`. `locals` are exposed to the
    # partial as local-ish reader methods for the duration of the call.
    def render(name, locals = {})
      body = File.read(File.join(INCLUDES_DIR, "#{name}.erb"))

      previous = {}
      locals.each do |key, value|
        previous[key] = respond_to?(key) ? send(key) : :__unset__
        define_singleton_method(key) { value }
      end

      ERB.new(body, trim_mode: "-").result(binding)
    ensure
      previous&.each do |key, value|
        if value == :__unset__
          singleton_class.send(:remove_method, key)
        else
          define_singleton_method(key) { value }
        end
      end
    end
  end
end
