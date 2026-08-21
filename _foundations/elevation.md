---
title: Elevation
summary: >-
  Two shadow levels only. Hairline (1px) borders do most of the elevation
  work in this system; shadow is reserved for the one floating layer in a view.
---

## Borders do the work

The source's own rule: "hairline (1px) borders and dividers do most of the
elevation work". A flat, bordered [Card]({{ '/components/card/' | relative_url }})
is the default everywhere. Shadow is the exception, not the baseline.

## The two levels

<ul class="ad-elevation-grid">
  {%- for step in site.data.tokens.scale.elevation.scale %}
  <li>
    <div class="ad-elevation-demo" style="box-shadow: {{ step.value }};"></div>
    <div class="ad-specimen__meta"><span class="ad-token-name">{{ step.token }}</span></div>
    <p class="ad-muted" style="font-size: var(--ad-step--2); margin: var(--ad-space-3xs) 0 0;">{{ step.usage }}</p>
  </li>
  {%- endfor %}
</ul>

{% example title="Flat vs. float" layout="grid" surface="sunken" %}
<article class="ad-card">
  <div class="ad-card__body">
    <h3 class="ad-card__title" style="font-size: var(--ad-step--1);">Flat</h3>
    <p class="ad-card__text">The default. A hairline border, no shadow.</p>
  </div>
</article>
<article class="ad-card ad-card--elevated">
  <div class="ad-card__body">
    <h3 class="ad-card__title" style="font-size: var(--ad-step--1);">Elevated</h3>
    <p class="ad-card__text">shadow-float. Reserved for one element per view — a Dialog, a Toast.</p>
  </div>
</article>
{% endexample %}

## Elevation in the dark theme

Shadows barely register on a near-black surface. The dark theme leans on
surface lightness instead — `--ad-color-surface-card` is one neutral step
lighter than `--ad-color-surface-page`, same as in light mode. The shadow
tokens still apply; they simply stop being the primary signal.

## Rules

- **At most one `--ad-shadow-float` on screen.** If two things both claim to
  be the topmost layer, neither is.
- **Border or shadow, not both, for a given surface's edge.** A card that
  both borders and floats looks like a sticker.
- **Never animate a shadow's blur.** If a floated element needs to arrive,
  animate its `opacity`, or do not animate it at all.
