---
title: Space
summary: >-
  Nine fluid Utopia steps, 3xs through 3xl — the same clamp() config as type,
  because there is no fixed base unit here to count multiples of.
---

## The scale

<div class="ad-ruler">
  {%- for step in site.data.tokens.scale.space.scale %}
  <div class="ad-ruler__row">
    <span class="ad-token-name">{{ step.token }}</span>
    <span class="ad-ruler__num">{{ step.px }}px</span>
    <span class="ad-ruler__bar" style="width: {{ step.value }}; min-width: 1px;"></span>
  </div>
  {%- endfor %}
</div>

## How to pick one

| Distance between | Reach for |
| --- | --- |
| An icon and its own label | `--ad-space-3xs` / `--ad-space-2xs` |
| A field's label and its control | `--ad-space-2xs` |
| Two controls in a row, CardRow padding | `--ad-space-xs` |
| Two fields in a form, a Dialog's title/footer padding | `--ad-space-s` |
| Card body padding, a Dialog's body padding | `--ad-space-m` |
| Two sections of a page | `--ad-space-l` |
| Major section spacing | `--ad-space-xl` / `--ad-space-2xl` |
| Hero and empty-state breathing room | `--ad-space-3xl` |

{% example title="The same card at three densities" layout="grid" %}
<article class="ad-card">
  <div class="ad-card__body" style="gap: var(--ad-space-3xs); padding: var(--ad-space-xs);">
    <h3 class="ad-card__title" style="font-size: var(--ad-step--1);">Compact</h3>
    <p class="ad-card__text">space-xs padding, space-3xs gap. For dense lists.</p>
  </div>
</article>
<article class="ad-card">
  <div class="ad-card__body">
    <h3 class="ad-card__title" style="font-size: var(--ad-step--1);">Default</h3>
    <p class="ad-card__text">space-m padding, space-2xs gap. What Card ships with.</p>
  </div>
</article>
<article class="ad-card">
  <div class="ad-card__body" style="gap: var(--ad-space-s); padding: var(--ad-space-l);">
    <h3 class="ad-card__title" style="font-size: var(--ad-step--1);">Roomy</h3>
    <p class="ad-card__text">space-l padding, space-s gap. For a card that is the whole screen.</p>
  </div>
</article>
{% endexample %}

## Radius

4/6/10px — small and quiet, kept modest so it reads as a neutral default
rather than any one source project's specific softness. Nothing pill-shaped
except true pills.

<ul class="ad-radius-grid">
  {%- for step in site.data.tokens.scale.radius.scale %}
  {%- unless step.token == "border-w" %}
  <li>
    <div class="ad-radius-demo" style="border-radius: {{ step.value }};"></div>
    <div class="ad-specimen__meta">
      <span class="ad-token-name">{{ step.token }}</span>
      <span>{{ step.value }}</span>
    </div>
    <p class="ad-muted" style="font-size: var(--ad-step--2); margin: var(--ad-space-3xs) 0 0;">{{ step.usage }}</p>
  </li>
  {%- endunless %}
  {%- endfor %}
</ul>

## Rules

- **Space comes from the parent.** A component sets its own internal padding
  and never its external margin; the layout that contains it owns the gap.
- **Use `gap`.** Flex and grid gaps do not collapse and do not need a
  `:last-child` reset.
- **A value not on the scale is a bug**, not a nudge. If a gap looks wrong,
  the scale is wrong and should change for everybody.
