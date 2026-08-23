---
title: Rationale
permalink: /rationale/
section: Start here
summary: >-
  The four rules this system's build actually enforces, and the one thing
  about it that is not arbitrary.
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
`--ad-color-text-tertiary` — this palette's own "muted-faint text" step — is
about 3.46:1 against the page in light mode, under the 4.5:1 floor for normal
text. That is not a bug to paper over by darkening a real brand value; it is
a documented, intentional property of the palette (see the
[Color page](<%= relative_url('/foundations/color/') %>)), so the contract
excludes it rather than silently forcing it to pass. Borders get the same
treatment for the same reason: this system's own rule is that hairline
borders do the elevation work, not high contrast, so it does not invent a
3:1 border assertion it never claimed.

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
    Never two accents in one view. Dark mode is opt-in — a
    <code>data-theme</code> toggle plus <code>prefers-color-scheme</code>,
    never inherited silently from the OS alone.
  </p>
</div>

## What this system does not have

Being honest about the design is being honest about the gaps too.

- **No formal component library or Figma file exists.** The sixteen
  components documented here are a from-scratch, best-guess personal-tool
  kit — not a literal recreation of any real app's screens, and not backed
  by a source of truth beyond this site.
- **No logo or brand mark.** Render "Arbitrary Definitions" or the
  project's own name in type wherever a mark would go — don't invent one.
- **The icon set (Lucide) is a flagged substitution** — there's no shipped
  icon library of its own yet.
- **Signal Teal, the default accent, is one pick among the sanctioned
  alternates**, not a fixed identity.
- **No Table, Callout, or Progress component.** An earlier pass at this site
  invented all three; they were removed rather than kept, since this system
  doesn't define them. (This documentation site still uses a plain
  `<table>` and an aside box for its own reference material — those are site
  chrome, not system components, and are not documented as one.)
- **Loop and Archive are generic demonstrations**, not real production
  screens.

Naming these is cheaper than being caught by them.
