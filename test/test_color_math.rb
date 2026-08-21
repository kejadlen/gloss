# frozen_string_literal: true

require "minitest/autorun"
require "arbitrary_definitions/color_math"

class TestColorMath < Minitest::Test
  CM = ArbitraryDefinitions::ColorMath

  def test_parses_six_digit_hex_with_and_without_hash
    assert_equal [249, 81, 22], CM.to_rgb("#f95116")
    assert_equal [249, 81, 22], CM.to_rgb("f95116")
  end

  def test_expands_three_digit_shorthand
    assert_equal [0xaa, 0xbb, 0xcc], CM.to_rgb("#abc")
  end

  def test_declines_values_that_have_no_single_luminance
    assert_nil CM.to_rgb("rgba(38, 35, 31, 0.5)")
    assert_nil CM.to_rgb("none")
    assert_nil CM.relative_luminance("var(--ad-color-canvas)")
    assert_nil CM.contrast_ratio("#ffffff", "none")
  end

  def test_luminance_endpoints
    assert_in_delta 0.0, CM.relative_luminance("#000000"), 1e-9
    assert_in_delta 1.0, CM.relative_luminance("#ffffff"), 1e-9
  end

  def test_black_on_white_is_the_maximum_contrast
    assert_in_delta 21.0, CM.contrast_ratio("#000000", "#ffffff"), 1e-6
  end

  def test_contrast_is_symmetric_and_self_contrast_is_one
    assert_in_delta CM.contrast_ratio("#ea360c", "#ffffff"),
                    CM.contrast_ratio("#ffffff", "#ea360c"), 1e-12
    assert_in_delta 1.0, CM.contrast_ratio("#ea360c", "#ea360c"), 1e-12
  end

  def test_known_pair_matches_the_wcag_reference_value
    # #767676 on white is the canonical "exactly AA" grey.
    assert_in_delta 4.54, CM.contrast_ratio("#767676", "#ffffff"), 0.01
  end

  def test_grades_use_the_normal_text_thresholds
    assert_equal "AAA", CM.grade(7.0)
    assert_equal "AA", CM.grade(4.5)
    assert_equal "AA Large", CM.grade(3.0)
    assert_equal "Fail", CM.grade(2.99)
    assert_equal "n/a", CM.grade(nil)
  end

  def test_large_text_grades_are_more_forgiving
    assert_equal "AA", CM.grade(3.0, large: true)
    assert_equal "AAA", CM.grade(4.5, large: true)
  end

  def test_readable_on_picks_the_higher_contrast_foreground
    assert_equal "#171512", CM.readable_on("#faf9f7")
    assert_equal "#ffffff", CM.readable_on("#171512")
  end
end
