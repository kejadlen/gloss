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
    assert_equal "#3a6a63", @tokens.resolve("accent.teal")
    assert_equal "#100f0d", @tokens.resolve("neutral.900")
  end

  def test_passes_literal_values_through_untouched
    assert_equal "#ffffff", @tokens.resolve("#ffffff")
    assert_equal "color-mix(in oklch, var(--ad-color-accent) 12%, white)",
                 @tokens.resolve("color-mix(in oklch, var(--ad-color-accent) 12%, white)")
  end

  def test_raises_on_a_reference_that_does_not_exist
    assert_raises(ArbitraryDefinitions::TokenSet::UnknownReference) do
      @tokens.resolve("neutral.55")
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

  # `accent` is a flat set of five unrelated brand hues, not a light-to-dark
  # scale, so it opts out via `monotonic: false` in color.yml. `neutral` and
  # `neutral-dark` stay covered: each is listed in the YAML in the order that
  # actually darkens (or, for neutral-dark, lightens) step to step, which can
  # differ from ascending step-number order — see the comment in color.yml.
  def test_ramps_run_light_to_dark_without_reversing
    @tokens.ramps.each do |ramp|
      next if ramp["monotonic"] == false

      luminances = ramp.fetch("steps").map do |step|
        ArbitraryDefinitions::ColorMath.relative_luminance(step.fetch("value"))
      end

      assert_equal luminances.sort.reverse, luminances,
                   "#{ramp['name']} steps are not monotonically darkening"
    end
  end

  # The contrast contract lives in _data/tokens/contrast.yml so that this
  # suite and the Colour page read the same list. Adding a pair there adds it
  # to the deploy gate here, with no second copy to keep in step.
  def test_the_contrast_contract_holds_in_both_themes
    by_name = @tokens.semantic_tokens.to_h { |token| [token["token"], token] }
    failures = []

    @tokens.contrast_pairs.each do |pair|
      %w[light dark].each do |theme|
        foreground = by_name.fetch(pair.fetch("foreground"))
        background = by_name.fetch(pair.fetch("background"))
        ratio = ArbitraryDefinitions::ColorMath.contrast_ratio(foreground[theme], background[theme])

        next if ratio && ratio >= pair.fetch("minimum")

        failures << "#{pair['foreground']} on #{pair['background']} is " \
                    "#{ratio ? ratio.round(2) : 'unmeasurable'}:1 in the #{theme} theme, " \
                    "below the #{pair['minimum']}:1 floor"
      end
    end

    assert_empty failures
  end

  def test_the_contract_only_names_tokens_that_exist
    known = @tokens.semantic_tokens.map { |token| token["token"] }
    named = @tokens.contrast_pairs.flat_map { |pair| pair.values_at("foreground", "background") }

    assert_empty named.uniq - known, "the contrast contract names tokens the system does not define"
  end

  # `color-text-tertiary` is the one deliberate exception: the source
  # documents that step as muted-faint metadata/placeholder text, not body
  # copy, and it is sub-AA on purpose (see contrast.yml's header comment and
  # the Colour foundation page). Holding it to the same floor as
  # `-primary`/`-secondary` would mean either lying about the contract or
  # darkening a real brand value just to make the suite green — this system
  # does neither.
  def test_the_contract_covers_the_pairings_that_matter
    covered = @tokens.contrast_pairs.map { |pair| pair.fetch("foreground") }

    required = @tokens.semantic_tokens
                      .map { |token| token["token"] }
                      .select { |name| name.start_with?("color-text", "color-on-") }
                      .reject { |name| %w[color-text-inverse color-text-tertiary].include?(name) }

    assert_empty required - covered, "a text token is not covered by the contrast contract"
  end

  def test_every_contract_pair_explains_itself
    undocumented = @tokens.contrast_pairs.reject { |pair| pair["note"].to_s.strip.length.positive? }

    assert_empty undocumented
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

end
