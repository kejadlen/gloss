# frozen_string_literal: true

$LOAD_PATH.unshift(File.expand_path("../lib", __dir__))

require "arbitrary_definitions/color_math"

module ArbitraryDefinitions
  # Liquid filters that let the documentation compute facts about its own
  # colours instead of restating them. Every contrast figure on the Colour
  # page is produced here, at build time, from the token value itself.
  module ColorFilters
    # Contrast ratio against a second colour, rounded for display: "8.42".
    def contrast_with(value, other)
      ratio = ColorMath.contrast_ratio(value, other)
      return "—" unless ratio

      format("%.2f", ratio)
    end

    # "AAA" / "AA" / "AA Large" / "Fail" for normal-size body text.
    def contrast_grade(value, other)
      ColorMath.grade(ColorMath.contrast_ratio(value, other))
    end

    # Whichever of white or near-black stays legible on this swatch.
    def readable_on(value)
      ColorMath.readable_on(value)
    end

    # 0–100, used to sort or annotate a ramp.
    def luminance_percent(value)
      luminance = ColorMath.relative_luminance(value)
      return "—" unless luminance

      (luminance * 100).round
    end

    def hex_color?(value)
      ColorMath.hex?(value)
    end

    # "color-accent" -> "--ad-color-accent"
    def custom_property(value)
      prefix = @context.registers[:site].config.fetch("token_prefix", "ad")
      "--#{prefix}-#{value}"
    end
  end
end

Liquid::Template.register_filter(ArbitraryDefinitions::ColorFilters)
