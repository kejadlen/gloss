---
title: Space
summary: >-
  A 4px base that thins out as it grows, because nobody can see the difference
  between 76px and 80px but everybody sees the difference between 4px and 8px.
---

## The ramp

Twelve steps. The gaps are tight and linear at the small end, where spacing
inside a control is doing real work, and geometric at the large end, where it is
just separating sections.

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
| A glyph and its own border | `--ad-space-2` / `--ad-space-3` |
| Two controls in a row | `--ad-space-3` |
| A label and its input | `--ad-space-2` |
| Two fields in a form | `--ad-space-5` |
| Two sections of a page | `--ad-space-8` |
| A page title and its first section | `--ad-space-6` |

{% example title="The same card at three densities" layout="grid" %}
<article class="ad-card">
  <div class="ad-card__body" style="gap: var(--ad-space-1); padding: var(--ad-space-3);">
    <h3 class="ad-card__title" style="font-size: var(--ad-text-md);">Compact</h3>
    <p class="ad-card__text">space-3 padding, space-1 gap. For dense tables and lists.</p>
  </div>
</article>
<article class="ad-card">
  <div class="ad-card__body">
    <h3 class="ad-card__title" style="font-size: var(--ad-text-md);">Default</h3>
    <p class="ad-card__text">space-4 padding, space-2 gap. What the component ships with.</p>
  </div>
</article>
<article class="ad-card">
  <div class="ad-card__body" style="gap: var(--ad-space-4); padding: var(--ad-space-6);">
    <h3 class="ad-card__title" style="font-size: var(--ad-text-md);">Roomy</h3>
    <p class="ad-card__text">space-6 padding, space-4 gap. For a card that is the whole page.</p>
  </div>
</article>
{% endexample %}

## Radius

<ul class="ad-radius-grid">
  {%- for step in site.data.tokens.scale.radius.scale %}
  <li>
    <div class="ad-radius-demo" style="border-radius: {{ step.value }};"></div>
    <div class="ad-specimen__meta">
      <span class="ad-token-name">{{ step.token }}</span>
      <span>{{ step.value }}</span>
    </div>
    <p class="ad-muted" style="font-size: var(--ad-text-xs); margin: var(--ad-space-1) 0 0;">{{ step.usage }}</p>
  </li>
  {%- endfor %}
</ul>

## Layout

<div class="ad-table-wrap">
  <table class="ad-table ad-table--compact">
    <thead><tr><th scope="col">Token</th><th scope="col">Value</th><th scope="col">Use for</th></tr></thead>
    <tbody>
      {%- for row in site.data.tokens.scale.layout.scale %}
      <tr>
        <td class="ad-token-name">{{ row.token | custom_property }}</td>
        <td class="ad-table__code">{{ row.value }}</td>
        <td>{{ row.usage }}</td>
      </tr>
      {%- endfor %}
    </tbody>
  </table>
</div>

## Rules

- **Space comes from the parent.** A component sets its own internal padding and
  never its external margin; the layout that contains it owns the gap. This is
  what stops margins from collapsing into arguments.
- **Use `gap`.** Flex and grid gaps do not collapse and do not need a
  `:last-child` reset.
- **A value not on the ramp is a bug**, not a nudge. If 14px is truly right, the
  ramp is wrong and should be changed for everybody.
