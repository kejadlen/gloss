---
title: Rationale
permalink: /rationale/
section: Start here
summary: >-
  Why this system was synthesized from real projects instead of written
  from a spec, and the contract its build actually enforces.
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

This system was not designed from a blank page. It was built by reading
several real, running personal projects and finding what they actually
share — not copied wholesale from any single one of them:

<div class="card-grid">
  <article class="card">
    <div class="card-body">
      <h3 style="margin:0; font: 600 var(--ad-step-0)/1.3 var(--ad-font-sans);">Warm, paper-like surfaces</h3>
      <p style="margin:0; color: var(--ad-color-text-secondary); font-size: var(--ad-step--1);">One app leaned on Georgia/Helvetica/mono, a swappable "Clay" accent, and a bottom capture dock — the source of this system's warm-neutral surface color.</p>
    </div>
  </article>
  <article class="card">
    <div class="card-body">
      <h3 style="margin:0; font: 600 var(--ad-step-0)/1.3 var(--ad-font-sans);">All-mono, plain grays</h3>
      <p style="margin:0; color: var(--ad-color-text-secondary); font-size: var(--ad-step--1);">Another was an all-mono interface with plain grays, red/green semantics, and a flash-bar toast — the source of this system's mono labels and semantic pair.</p>
    </div>
  </article>
  <article class="card">
    <div class="card-body">
      <h3 style="margin:0; font: 600 var(--ad-step-0)/1.3 var(--ad-font-sans);">Humanist sans, full dark palette</h3>
      <p style="margin:0; color: var(--ad-color-text-secondary); font-size: var(--ad-step--1);">A third paired humanist sans with mono, a warm cream surface, a full dark palette, and underline tabs — the source of this system's dark-theme approach.</p>
    </div>
  </article>
</div>

The one literal constant across all of them is an identical
[Utopia](https://utopia.fyi) fluid type/space scale — 320→1240px viewport,
18→20px body, a 1.20→1.25 ratio — adopted verbatim as this system's spine.
Everything else (palette, radius, component set) is a synthesized middle
ground, deliberately not lifted wholesale from any one source.

## What actually makes it a system

Not the quality of the individual choices. The properties below:

<div class="card-grid">
  <article class="card">
    <div class="card-body">
      <h3 style="margin:0; font: 600 var(--ad-step-0)/1.3 var(--ad-font-sans);">It is written down once</h3>
      <p style="margin:0; color: var(--ad-color-text-secondary); font-size: var(--ad-step--1);">
        One hand-maintained stylesheet of custom properties. Not a Figma
        library that disagrees with the CSS, and not a spreadsheet somebody
        exports by hand.
      </p>
    </div>
  </article>
  <article class="card">
    <div class="card-body">
      <h3 style="margin:0; font: 600 var(--ad-step-0)/1.3 var(--ad-font-sans);">It has names</h3>
      <p style="margin:0; color: var(--ad-color-text-secondary); font-size: var(--ad-step--1);">
        <code>--ad-color-danger</code> survives a change of mind about which
        red. <code>#ad3a2c</code> does not.
      </p>
    </div>
  </article>
  <article class="card">
    <div class="card-body">
      <h3 style="margin:0; font: 600 var(--ad-step-0)/1.3 var(--ad-font-sans);">It is actually used</h3>
      <p style="margin:0; color: var(--ad-color-text-secondary); font-size: var(--ad-step--1);">
        Every color, type, spacing, radius, elevation, and motion value in
        the components is a <code>var(--ad-*)</code>. Not one is a literal.
      </p>
    </div>
  </article>
  <article class="card">
    <div class="card-body">
      <h3 style="margin:0; font: 600 var(--ad-step-0)/1.3 var(--ad-font-sans);">It can be changed</h3>
      <p style="margin:0; color: var(--ad-color-text-secondary); font-size: var(--ad-step--1);">
        Because of the three above, swapping the accent for Clay, Ochre, Ink
        Blue, or Plum is a one-line diff.
      </p>
    </div>
  </article>
</div>

## The one thing that is not arbitrary

Contrast. A ratio is a physical fact about two colors and a pair of eyes,
and it does not care what the brand guidelines say.

So it is the one thing this system checks rather than eyeballs. Five
pairings have to hold, computed once from the token values with the
standard WCAG 2.1 relative-luminance formula and written down as fact on the
[contract table](<%= relative_url('/foundations/color/') %>#contrast-that-has-to-hold)
rather than re-derived on every build — a personal site does not need a test
suite standing between an edit and a deploy to keep five numbers honest.

That contract is deliberately narrower than "every color in the system".
`--ad-color-text-tertiary` — the source's own "muted-faint text" step — is
about 3.46:1 against the page in light mode, under the 4.5:1 floor for normal
text. That is not a bug to paper over by darkening a real brand value; it is
a documented, intentional property of the palette (see the
[Color page](<%= relative_url('/foundations/color/') %>)), so the contract
excludes it rather than silently forcing it to pass. Borders get the same
treatment for the same reason: the source's own rule is that hairline borders
do the elevation work, not high contrast, so this system does not invent a
3:1 border assertion the source never claimed.

## The four rules

<div class="ad-callout">
  <p class="type-label" style="margin-bottom: var(--ad-space-2xs); display:block;">1. No color and no duration outside tokens.css</p>
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
    Every semantic alias on the <a href="<%= relative_url('/foundations/color/') %>">Color page</a>
    carries a usage note. A token nobody can describe is a token nobody will
    use correctly.
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

- **No shared component library or Figma exists across the source
  projects** — they are hand-rolled app CSS, not a design system. The
  sixteen components documented here are a from-scratch, best-guess
  personal-tool kit, grounded in real patterns found across those apps (a
  flash-bar toast; a drop-up menu behind Dialog's flat treatment; a
  segmented control and an underline-tabs pattern behind Tabs' two
  variants) — not a literal recreation of any one app's screens.
- **No logo or brand mark.** The source is explicit: render "Arbitrary
  Definitions" or the project's own name in type wherever a mark would go,
  and do not invent one.
- **The icon set (Lucide) is a flagged substitution.** No source project
  ships a shared icon library; one hand-draws its own line icons, and the
  others mostly avoid icons.
- **Signal Teal, the default accent, is a synthesized pick**, not lifted from
  any one project.
- **No Table, Callout, or Progress component.** An earlier pass at this site
  invented all three; none exists in the source system, so they were removed
  rather than re-skinned. (This documentation site still uses a plain
  `<table>` and an aside box for its own reference material — those are site
  chrome, not system components, and are not documented as one.)
- **Loop and Archive are generic demonstrations**, not recreations of any
  specific source app.

Naming these is cheaper than being caught by them.
