---
title: Elevation
summary: >-
  Five levels, each a two-shadow stack. Elevation is a claim about hierarchy,
  not about distance — level 3 does not mean "12 pixels above the page".
---

## The levels

Every level pairs a tight contact shadow with a wider ambient one. That is what
keeps a shadow from reading as a grey smudge: the near shadow anchors the edge,
the far shadow suggests the light.

<ul class="ad-elevation-grid">
  {%- for step in site.data.tokens.scale.elevation.scale %}
  <li>
    <div class="ad-elevation-demo" style="box-shadow: {{ step.value }};"></div>
    <div class="ad-specimen__meta"><span class="ad-token-name">{{ step.token }}</span></div>
    <p class="ad-muted" style="font-size: var(--ad-text-xs); margin: var(--ad-space-1) 0 0;">{{ step.usage }}</p>
  </li>
  {%- endfor %}
</ul>

## Border or shadow, not both

A card can separate itself from the canvas with an edge or with a shadow. Doing
both makes it look like a sticker. The system's default card is bordered and
flat; `--ad-card--raised` swaps in elevation 1 and `--ad-card--floating` drops
the border entirely.

{% example title="Three ways to lift a card" layout="grid" surface="sunken" %}
<article class="ad-card">
  <div class="ad-card__body">
    <h3 class="ad-card__title" style="font-size: var(--ad-text-md);">Bordered</h3>
    <p class="ad-card__text">The default. Works on any background.</p>
  </div>
</article>
<article class="ad-card ad-card--raised">
  <div class="ad-card__body">
    <h3 class="ad-card__title" style="font-size: var(--ad-text-md);">Raised</h3>
    <p class="ad-card__text">Border plus elevation 1, for a busy canvas.</p>
  </div>
</article>
<article class="ad-card ad-card--floating">
  <div class="ad-card__body">
    <h3 class="ad-card__title" style="font-size: var(--ad-text-md);">Floating</h3>
    <p class="ad-card__text">Elevation 2, no border. For things that overlay.</p>
  </div>
</article>
{% endexample %}

## Elevation in the dark theme

Shadows barely register on a near-black canvas. The dark theme leans on surface
lightness instead: `--ad-color-surface` is one ink step lighter than
`--ad-color-canvas`, and `--ad-color-surface-raised` is lighter again. The
shadow tokens still apply — they just stop being the primary signal.

<div class="ad-callout ad-callout--neutral">
  <div class="ad-callout__body">
    <p style="margin:0">
      Switch themes and watch the row above. In light, the three cards separate
      by shadow. In dark, they separate by surface. Same markup either way.
    </p>
  </div>
</div>

## Rules

- **One level per layer, and no skipping.** A dropdown inside a dialog is not
  elevation 4; the dialog owns the elevation and the dropdown inherits the
  context.
- **At most one level 4 on screen.** If two things both claim to be the topmost
  layer, neither is.
- **Never animate a shadow's blur.** Animate `opacity` on a pseudo-element, or
  do not animate it at all.
