---
title: Why arbitrary
permalink: /rationale/
section: Start here
summary: >-
  Why this system was synthesized from three real projects instead of
  written from a spec, and the contract its build actually enforces.
---

## Where the name comes from

Arbitrary Definitions is a personal umbrella for side projects — self-hosted,
single-user tools built for one household or one person, never a SaaS
product. Almost nothing in a design system is derived: the accent is teal
because someone liked it, the type scale ratio is 1.20 at the small end and
1.25 at the large end because that is what looked right, not because either
number is correct. What makes it a *system* is not that the choices are
correct but that they were written down once, given names, actually used, and
are therefore changeable.

## Synthesized, not specified

This system was not designed from a blank page. It was built by reading three
real, running personal projects and finding what they actually share:

<div class="ad-card-grid">
  <article class="ad-card">
    <div class="ad-card__body">
      <h3 class="ad-card__title"><a href="https://github.com/kejadlen/domus">domus</a></h3>
      <p class="ad-card__text">Household inventory & document archive. Warm paper surfaces, a Georgia/Helvetica/mono mix, a swappable "Clay" accent, a bottom capture dock.</p>
    </div>
  </article>
  <article class="ad-card">
    <div class="ad-card__body">
      <h3 class="ad-card__title"><a href="https://github.com/kejadlen/ketchup">ketchup</a></h3>
      <p class="ad-card__text">Recurring-task tracker. All-mono interface, plain grays, red/green semantics, a flash-bar toast.</p>
    </div>
  </article>
  <article class="ad-card">
    <div class="ad-card__body">
      <h3 class="ad-card__title"><a href="https://github.com/kejadlen/quire">quire</a></h3>
      <p class="ad-card__text">Personal git forge / CI server. Humanist sans + mono, a warm cream surface, a full dark palette, underline tabs.</p>
    </div>
  </article>
</div>

The one literal constant across all three is an identical
[Utopia](https://utopia.fyi) fluid type/space scale — 320→1240px viewport,
18→20px body, a 1.20→1.25 ratio — adopted verbatim as this system's spine.
Everything else (palette, radius, component set) is a synthesized middle
ground, deliberately not lifted wholesale from any one of the three.

## What actually makes it a system

Not the quality of the individual choices. The properties below:

<div class="ad-card-grid">
  <article class="ad-card">
    <div class="ad-card__body">
      <h3 class="ad-card__title">It is written down once</h3>
      <p class="ad-card__text">
        Four YAML files. Not a Figma library that disagrees with the CSS, and
        not a spreadsheet somebody exports by hand.
      </p>
    </div>
  </article>
  <article class="ad-card">
    <div class="ad-card__body">
      <h3 class="ad-card__title">It has names</h3>
      <p class="ad-card__text">
        <code>--ad-color-danger</code> survives a change of mind about which
        red. <code>#ad3a2c</code> does not.
      </p>
    </div>
  </article>
  <article class="ad-card">
    <div class="ad-card__body">
      <h3 class="ad-card__title">It is actually used</h3>
      <p class="ad-card__text">
        Every colour, type, spacing, radius, elevation, and motion value in
        the components is a <code>var(--ad-*)</code>. Not one is a literal.
      </p>
    </div>
  </article>
  <article class="ad-card">
    <div class="ad-card__body">
      <h3 class="ad-card__title">It can be changed</h3>
      <p class="ad-card__text">
        Because of the three above, swapping the accent for Clay, Ochre, Ink
        Blue, or Plum is a one-line diff.
      </p>
    </div>
  </article>
</div>

## The one thing that is not arbitrary

Contrast. A ratio is a physical fact about two colours and a pair of eyes,
and it does not care what the brand guidelines say.

So it is the one thing the build refuses to take on trust.
`_data/tokens/contrast.yml` names
<%= site.data.tokens.contrast.text.pairs.size %> pairings that have to hold;
`lib/arbitrary_definitions/color_math.rb` computes WCAG relative luminance
from the token values, and `test/test_token_set.rb` asserts every one of them
in both themes. The [contract table](<%= relative_url('/foundations/color/') %>#contrast-that-has-to-hold)
is rendered from that same file. If a token change drops any pairing below
its floor, `rake test` fails and the site does not deploy.

```console
$ bundle exec rake test
0 failures, 0 errors, 0 skips
```

That contract is deliberately narrower than "every colour in the system".
`--ad-color-text-tertiary` — the source's own "muted-faint text" step — is
about 3.46:1 against the page in light mode, under the 4.5:1 floor for normal
text. That is not a bug the build should paper over by darkening a real brand
value; it is a documented, intentional property of the palette (see the
[Colour page](<%= relative_url('/foundations/color/') %>)), so the contract
excludes it rather than silently forcing it to pass. Borders get the same
treatment for the same reason: the source's own rule is that hairline borders
do the elevation work, not high contrast, so this system does not invent a
3:1 border assertion the source never claimed.

## The four rules

<div class="ad-callout">
  <p class="type-label" style="margin-bottom: var(--ad-space-2xs); display:block;">1. No colour and no duration outside the token files</p>
  <p style="margin:0; font-size: var(--ad-step--1);">
    A hex or a duration in a component stylesheet is a decision made in the
    dark, and it is the kind that breaks the moment somebody adds a theme. No
    component stylesheet in this repository contains either; the one flagged
    exception is Select's chevron, which CSS cannot point at a custom
    property inside a data-URI, and it is commented as such.
  </p>
</div>

<div class="ad-callout">
  <p class="type-label" style="margin-bottom: var(--ad-space-2xs); display:block;">2. Components read aliases, never ramps</p>
  <p style="margin:0; font-size: var(--ad-step--1);">
    <code>--ad-color-text-primary</code>, not <code>--ad-neutral-900</code>.
    The ramp is raw material; the alias is the decision. This is the whole
    reason the dark theme is a block of repointed aliases rather than a
    second stylesheet.
  </p>
</div>

<div class="ad-callout">
  <p class="type-label" style="margin-bottom: var(--ad-space-2xs); display:block;">3. Every token says what it is for</p>
  <p style="margin:0; font-size: var(--ad-step--1);">
    A <code>usage</code> line on every semantic token, enforced by a test. A
    token nobody can describe is a token nobody will use correctly.
  </p>
</div>

<div class="ad-callout">
  <p class="type-label" style="margin-bottom: var(--ad-space-2xs); display:block;">4. One accent, one dark-mode convention</p>
  <p style="margin:0; font-size: var(--ad-step--1);">
    Never two accents in one view — the source is explicit about this. Dark
    mode is opt-in in the source (a <code>.theme-dark</code> class); this
    site adapts that to its own <code>data-theme</code> toggle plus
    <code>prefers-color-scheme</code>, which is functionally equivalent and
    keeps the site's existing toggle working.
  </p>
</div>

## What this system does not have

Being honest about the synthesized parts means being honest about the gaps.

- **No shared component library or Figma exists across the three source
  projects** — they are hand-rolled app CSS, not a design system. The
  sixteen components documented here are a from-scratch, best-guess
  personal-tool kit, grounded in real patterns found in the three apps
  (ketchup's flash-bar → Toast; domus's drop-up menu → Dialog's flat
  treatment; domus's segmented control and quire's underline tabs → Tabs'
  two variants) — not a literal recreation of any one app's screens.
- **No logo or brand mark.** The source is explicit: render "Arbitrary
  Definitions" or the project's own name in type wherever a mark would go,
  and do not invent one.
- **The icon set (Lucide) is a flagged substitution.** No source project
  ships a shared icon library; domus hand-draws its own line icons, and
  ketchup/quire mostly avoid icons.
- **Signal Teal, the default accent, is a synthesized pick**, not lifted from
  any one project.
- **No Table, Callout, or Progress component.** An earlier pass at this site
  invented all three; none exists in the source system, so they were removed
  rather than re-skinned. (This documentation site still uses a plain
  `<table>` and an aside box for its own reference material — those are site
  chrome, not system components, and are not documented as one.)
- **Loop and Archive are generic demonstrations**, not recreations of
  ketchup or domus specifically.

Naming these is cheaper than being caught by them.
