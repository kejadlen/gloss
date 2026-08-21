# frozen_string_literal: true

require "minitest/autorun"
require "arbitrary_definitions/token_set"
require "arbitrary_definitions/color_math"

class TestTokenSet < Minitest::Test
  TOKENS_DIR = File.expand_path("../_data/tokens", __dir__)

  def setup
    @tokens = ArbitraryDefinitions::TokenSet.new(dir: TOKENS_DIR)
  end

  def test_resolves_a_ramp_reference_to_its_hex
    assert_equal "#f95116", @tokens.resolve("persimmon.500")
    assert_equal "#26231f", @tokens.resolve("ink.900")
  end

  def test_passes_literal_values_through_untouched
    assert_equal "#ffffff", @tokens.resolve("#ffffff")
    assert_equal "rgba(0, 0, 0, 0.65)", @tokens.resolve("rgba(0, 0, 0, 0.65)")
  end

  def test_raises_on_a_reference_that_does_not_exist
    assert_raises(ArbitraryDefinitions::TokenSet::UnknownReference) do
      @tokens.resolve("persimmon.55")
    end
  end

  # The point of the semantic layer is that it is complete: if a token exists
  # in light it has to exist in dark, or the theme toggle leaves holes.
  def test_every_semantic_token_resolves_in_both_themes
    @tokens.semantic_tokens.each do |token|
      refute_nil token["light"], "#{token['token']} has no light value"
      refute_nil token["dark"], "#{token['token']} has no dark value"
    end
  end

  def test_every_semantic_token_documents_its_usage
    undocumented = @tokens.semantic_tokens.reject { |token| token["usage"].to_s.strip.length.positive? }

    assert_empty undocumented.map { |token| token["token"] },
                 "semantic tokens must say what they are for"
  end

  def test_semantic_token_names_are_unique
    names = @tokens.semantic_tokens.map { |token| token["token"] }

    assert_equal names.uniq, names, "duplicate semantic token names"
  end

  def test_ramps_run_light_to_dark_without_reversing
    @tokens.ramps.each do |ramp|
      luminances = ramp.fetch("steps").map do |step|
        ArbitraryDefinitions::ColorMath.relative_luminance(step.fetch("value"))
      end

      assert_equal luminances.sort.reverse, luminances,
                   "#{ramp['name']} steps are not monotonically darkening"
    end
  end

  # The contrast contract. Every pair here is one a reader actually has to
  # decipher, so each owes WCAG AA in both themes. These assertions are the
  # reason the ink ramp is as dark as it is.
  TEXT_PAIRS = [
    %w[color-text color-canvas],
    %w[color-text color-surface],
    %w[color-text-muted color-canvas],
    %w[color-text-subtle color-canvas],
    %w[color-accent color-canvas],
    %w[color-on-accent color-accent],
    %w[color-positive color-positive-subtle],
    %w[color-caution color-caution-subtle],
    %w[color-critical color-critical-subtle],
    %w[color-info color-info-subtle],
    # Filled surfaces: a label sitting directly on a status or accent fill.
    %w[color-on-critical color-critical-solid],
    %w[color-text-inverse color-accent],
    %w[color-text-inverse color-positive],
    %w[color-text-inverse color-caution],
    %w[color-text-inverse color-critical],
    %w[color-text-inverse color-info],
    %w[color-text-inverse color-text-muted],
  ].freeze

  # Non-text contrast (SC 1.4.11): the border a user is told to rely on to
  # find a control needs 3:1, even though it carries no glyphs.
  NON_TEXT_PAIRS = [
    %w[color-border-strong color-surface],
    %w[color-focus color-canvas],
  ].freeze

  def test_text_pairs_clear_wcag_aa_in_both_themes
    assert_pairs(TEXT_PAIRS, 4.5)
  end

  def test_non_text_pairs_clear_the_three_to_one_threshold
    assert_pairs(NON_TEXT_PAIRS, 3.0)
  end

  def test_css_emits_a_root_block_and_both_dark_selectors
    css = @tokens.to_css

    assert_includes css, ":root {"
    assert_includes css, '@media (prefers-color-scheme: dark)'
    assert_includes css, ':root[data-theme="dark"]'
    assert_includes css, "@media (prefers-reduced-motion: reduce)"
  end

  def test_css_contains_no_unresolved_references
    unresolved = @tokens.to_css.scan(/:\s*([a-z][a-z0-9_]*\.[a-z0-9]+);/)

    assert_empty unresolved.flatten, "token references leaked into the stylesheet"
  end

  def test_css_declares_every_semantic_token_in_root
    root = @tokens.to_css[/:root \{(.*?)\n\}/m, 1]

    @tokens.semantic_tokens.each do |token|
      assert_includes root, "#{token['name']}:", "#{token['name']} missing from :root"
    end
  end

  def test_braces_balance
    css = @tokens.to_css

    assert_equal css.count("{"), css.count("}")
  end

  private

  def assert_pairs(pairs, threshold)
    by_name = @tokens.semantic_tokens.to_h { |token| [token["token"], token] }

    pairs.each do |(foreground, background)|
      %w[light dark].each do |theme|
        ratio = ArbitraryDefinitions::ColorMath.contrast_ratio(
          by_name.fetch(foreground)[theme],
          by_name.fetch(background)[theme],
        )

        assert_operator ratio, :>=, threshold,
                        "#{foreground} on #{background} is #{ratio.round(2)}:1 in the " \
                        "#{theme} theme, below the #{threshold}:1 floor"
      end
    end
  end
end
