---
title: Typography
summary: >-
  Two families, ten sizes, four weights. The specimens below are rendered with
  the same custom properties the components use, at the sizes the tokens define.
---

## Families

Fraunces carries the wordmark and page titles; its optical sizing axis keeps
large settings from looking spindly. Inter does everything else. Code is set in
JetBrains Mono, with a system monospace fallback that will not shift the layout
if the webfont never arrives.

{% for family in site.data.tokens.scale.typography.families %}
<div class="ad-specimen">
  <div class="ad-specimen__meta">
    <span class="ad-token-name">{{ family.token | custom_property }}</span>
    <span>{{ family.usage }}</span>
  </div>
  <div class="ad-specimen__sample" style="font-family: var({{ family.token | custom_property }}); font-size: 1.75rem;">
    Arbitrary Definitions — 0123456789
  </div>
</div>
{% endfor %}

## Scale

A minor-third-ish ramp, hand-adjusted at the small end where a strict ratio
produces sizes nobody can tell apart. Sizes are declared in `rem` so a reader who
has changed their browser's base font size gets a system that scales with them.

{% for size in site.data.tokens.scale.typography.sizes %}
<div class="ad-specimen">
  <div class="ad-specimen__meta">
    <span class="ad-token-name">{{ size.token | custom_property }}</span>
    <span>{{ size.value }} · {{ size.px }}px</span>
    <span>{{ size.usage }}</span>
  </div>
  <div class="ad-specimen__sample" style="font-size: var({{ size.token | custom_property }});">
    The quick brown fox jumps over the lazy dog
  </div>
</div>
{% endfor %}

## Line height, weight, tracking

<div class="ad-table-wrap">
  <table class="ad-table ad-table--compact">
    <thead>
      <tr><th scope="col">Token</th><th scope="col">Value</th><th scope="col">Use for</th></tr>
    </thead>
    <tbody>
      {%- assign type = site.data.tokens.scale.typography %}
      {%- for row in type.line_heights %}
      <tr><td class="ad-token-name">{{ row.token | custom_property }}</td><td class="ad-table__code">{{ row.value }}</td><td>{{ row.usage }}</td></tr>
      {%- endfor %}
      {%- for row in type.weights %}
      <tr><td class="ad-token-name">{{ row.token | custom_property }}</td><td class="ad-table__code">{{ row.value }}</td><td>{{ row.usage }}</td></tr>
      {%- endfor %}
      {%- for row in type.tracking %}
      <tr><td class="ad-token-name">{{ row.token | custom_property }}</td><td class="ad-table__code">{{ row.value }}</td><td>{{ row.usage }}</td></tr>
      {%- endfor %}
    </tbody>
  </table>
</div>

## In practice

{% example title="A heading, a lead, and body copy" layout="stack" %}
<div style="max-width: 34rem;">
  <p class="ad-overline">Foundations</p>
  <h2 style="margin: var(--ad-space-2) 0 var(--ad-space-3);">Type is the cheapest hierarchy you have</h2>
  <p class="ad-lead">
    Before reaching for a border, a background, or a badge, try moving one step
    up the size ramp and one step down the colour ramp.
  </p>
  <p>
    Body copy sits at <code>--ad-text-md</code> with <code>--ad-leading-normal</code>,
    capped at <code>--ad-measure-prose</code> so a line never runs past about
    seventy-five characters. Long measures are the single most common readability
    failure in documentation, and the fix costs one declaration.
  </p>
</div>
{% endexample %}

## Rules

- **Two families, and no third.** A new typeface needs a reason that a weight or
  a size cannot supply.
- **Uppercase only at `--ad-text-2xs` with `--ad-tracking-wide`.** Uppercase at
  body size is shouting and it is also slower to read.
- **Never set a size in `px`.** The ramp is in `rem` on purpose.
- **`text-wrap: balance` on headings, `pretty` on lead paragraphs.** Both are in
  the base stylesheet; components do not need to repeat them.
