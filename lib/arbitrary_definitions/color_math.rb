# frozen_string_literal: true

module ArbitraryDefinitions
  # WCAG 2.1 colour maths, kept free of any Jekyll dependency so it can be
  # unit tested on its own (see test/test_color_math.rb).
  #
  # The swatch tables on the Colour page call into this at build time, which
  # is the whole point: a contrast number that is computed from the token
  # cannot drift away from the token.
  module ColorMath
    module_function

    HEX_PATTERN = /\A#?(\h{3}|\h{6})\z/
    # Values that are not a flat hex — rgba(), colour functions, `none` —
    # have no single luminance, so we decline rather than guess.
    UNMEASURABLE = nil

    # "#f95116" or "f95116" or "#abc" -> [249, 81, 22]
    def to_rgb(hex)
      match = HEX_PATTERN.match(hex.to_s.strip)
      return UNMEASURABLE unless match

      digits = match[1]
      digits = digits.chars.flat_map { |c| [c, c] }.join if digits.length == 3
      digits.scan(/\h{2}/).map { |pair| pair.to_i(16) }
    end

    def hex?(value)
      !to_rgb(value).nil?
    end

    # WCAG relative luminance, 0.0 (black) to 1.0 (white).
    def relative_luminance(hex)
      rgb = to_rgb(hex)
      return UNMEASURABLE unless rgb

      r, g, b = rgb.map do |channel|
        srgb = channel / 255.0
        srgb <= 0.04045 ? srgb / 12.92 : ((srgb + 0.055) / 1.055)**2.4
      end

      (0.2126 * r) + (0.7152 * g) + (0.0722 * b)
    end

    # Contrast ratio between two colours, 1.0 to 21.0.
    def contrast_ratio(one, two)
      a = relative_luminance(one)
      b = relative_luminance(two)
      return UNMEASURABLE unless a && b

      lighter, darker = a > b ? [a, b] : [b, a]
      (lighter + 0.05) / (darker + 0.05)
    end

    # The WCAG grade a pair earns for normal-size body text.
    # Large text (>= 18.66px bold or 24px) passes AA at 3.0, which the
    # `large:` keyword accounts for.
    def grade(ratio, large: false)
      return "n/a" unless ratio

      aa  = large ? 3.0 : 4.5
      aaa = large ? 4.5 : 7.0

      if ratio >= aaa then "AAA"
      elsif ratio >= aa then "AA"
      elsif ratio >= 3.0 then "AA Large"
      else "Fail"
      end
    end

    # Whichever of the two candidates reads more clearly on `background`.
    def readable_on(background, light: "#ffffff", dark: "#171512")
      on_light = contrast_ratio(background, light)
      on_dark  = contrast_ratio(background, dark)
      return dark unless on_light && on_dark

      on_light >= on_dark ? light : dark
    end
  end
end
