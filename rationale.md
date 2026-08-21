---
title: Why arbitrary
permalink: /rationale/
section: Start here
summary: >-
  The case for writing down a decision you cannot fully justify, and the four
  rules this system actually enforces.
---

## The uncomfortable part

Almost nothing in a design system is derived. The spacing base is 4px because
4 divides nicely and screens used to be 1x, not because 4 is correct. The accent
is persimmon because somebody liked it. The type ramp is a minor third until it
isn't, at the small end, where a strict ratio produces 13.3px and 11.1px and
nobody can tell those apart anyway.

Design systems that pretend otherwise end up in an unwinnable argument. Somebody
asks *why* the gap is 16px and not 14px, and the honest answer — "it isn't
16 because it's right, it's right because it's 16" — sounds like a dodge. So the
team invents a justification, and then defends the justification instead of the
decision, and a year later nobody can change the number because the reasoning
has calcified around it.

## What actually makes it a system

Not the quality of the individual choices. The properties below:

<div class="ad-card-grid">
  <article class="ad-card">
    <div class="ad-card__body">
      <h3 class="ad-card__title">It is written down once</h3>
      <p class="ad-card__text">
        Three YAML files. Not a Figma library that disagrees with the CSS, and
        not a spreadsheet somebody exports by hand.
      </p>
    </div>
  </article>
  <article class="ad-card">
    <div class="ad-card__body">
      <h3 class="ad-card__title">It has names</h3>
      <p class="ad-card__text">
        <code>--ad-color-critical</code> survives a change of mind about which
        red. <code>#b01a3c</code> does not.
      </p>
    </div>
  </article>
  <article class="ad-card">
    <div class="ad-card__body">
      <h3 class="ad-card__title">It is actually used</h3>
      <p class="ad-card__text">
        Every colour, type, spacing, radius, elevation, and motion value in the
        components is a <code>var(--ad-*)</code>. Not one is a literal.
      </p>
    </div>
  </article>
  <article class="ad-card">
    <div class="ad-card__body">
      <h3 class="ad-card__title">It can be changed</h3>
      <p class="ad-card__text">
        Because of the three above, moving the accent one ramp step is a
        one-line diff — which is exactly what happened while this site was built.
      </p>
    </div>
  </article>
</div>

## The one thing that is not arbitrary

Contrast. A ratio is a physical fact about two colours and a pair of eyes, and
it does not care what the brand guidelines say.

So it is the one thing the build refuses to take on trust.
`_data/tokens/contrast.yml` names
{{ site.data.tokens.contrast.text.pairs | size }} text pairings and
{{ site.data.tokens.contrast.non_text.pairs | size }} non-text pairings that
have to hold; `lib/arbitrary_definitions/color_math.rb` computes WCAG relative
luminance from the token values, and `test/test_token_set.rb` asserts every one
of them in both themes. The [contract table]({{ '/foundations/color/' | relative_url }}#contrast-that-has-to-hold)
is rendered from that same file. If a token change drops any pairing below its
floor, `rake test` fails and the site does not deploy.

That is not a formality. The accent in this system started at persimmon 600 —
a nicer orange — and the test caught it at 4.17:1, under the 4.5:1 floor for
normal text. It moved to 700. The ink ramp got darker at steps 500 through 800
for the same reason.

The dark theme caught a second class of mistake that no single ratio would have
found: the destructive button was filled with `--ad-color-critical`, which is a
*text* colour and therefore goes pale in dark mode. White label, pink button.
The fix was a separate `--ad-color-critical-solid` token — and, more usefully,
a rule in the suite that no `color-text-*` or `color-on-*` token may sit outside
the contract at all, so the next filled surface cannot be forgotten.

```console
$ bundle exec rake test
0 failures, 0 errors, 0 skips
```

## The four rules

<div class="ad-callout ad-callout--accent">
  <div class="ad-callout__body">
    <p class="ad-callout__title">1. No colour and no motion outside the token files</p>
    <p style="margin:0">
      A hex or a duration in a component stylesheet is a decision made in the
      dark, and it is the kind that breaks the moment somebody adds a theme. No
      component stylesheet in this repository contains either; the single
      exception is the chevron inside the select's data-URI, which CSS cannot
      reach with a custom property, and it is commented as such. Geometry is
      looser: a 1px hairline or a control's own height is the component's
      business. Its <em>colour</em> never is.
    </p>
  </div>
</div>

<div class="ad-callout ad-callout--accent">
  <div class="ad-callout__body">
    <p class="ad-callout__title">2. Components read aliases, never ramps</p>
    <p style="margin:0">
      <code>--ad-color-text</code>, not <code>--ad-ink-900</code>. The ramp is
      raw material; the alias is the decision. This is the whole reason the dark
      theme is a block of repointed aliases rather than a second stylesheet.
    </p>
  </div>
</div>

<div class="ad-callout ad-callout--accent">
  <div class="ad-callout__body">
    <p class="ad-callout__title">3. Every token says what it is for</p>
    <p style="margin:0">
      A <code>usage</code> line on every semantic token, enforced by a test. A
      token nobody can describe is a token nobody will use correctly.
    </p>
  </div>
</div>

<div class="ad-callout ad-callout--accent">
  <div class="ad-callout__body">
    <p class="ad-callout__title">4. The docs are generated from the tokens</p>
    <p style="margin:0">
      Every swatch, every ratio, and every table on this site is rendered from
      the same YAML the stylesheet is compiled from. Documentation that is
      re-typed is documentation that will be wrong by Thursday.
    </p>
  </div>
</div>

## What this system does not have

Being honest about the arbitrary parts means being honest about the gaps, too.
This is a small system built to be read, not a product design system. It has no
modal, no menu, no toast, no date picker, no icon set, no RTL audit beyond using
logical properties, and no component tests. The border colour knowingly sits
under the 3:1 that WCAG asks of a meaningful boundary — see the note on
[Colour]({{ '/foundations/color/' | relative_url }}).

Those are all real omissions. Naming them is cheaper than being caught by them.
