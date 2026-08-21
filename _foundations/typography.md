---
title: Typography
summary: >-
  Three families, eight fluid steps, eight compound styles. Sans for
  interface, mono for every label and technical value, serif as an opt-in
  reading variant.
---

## Families

{% for family in site.data.tokens.scale.typography.families %}
<div class="ad-specimen">
  <div class="ad-specimen__meta">
    <span class="ad-token-name">{{ family.token | custom_property }}</span>
    <span>{{ family.usage }}</span>
  </div>
  <div class="ad-specimen__sample" style="font-family: var({{ family.token | custom_property }}); font-size: 1.5rem;">
    Arbitrary Definitions — 0123456789
  </div>
</div>
{% endfor %}

Only one webfont is loaded — IBM Plex Mono, at 400/500/600:

```css
{{ site.data.tokens.scale.typography.webfont_import }}
```

Sans is a web-safe system stack; serif is Georgia-based and opt-in, for a
project that wants an editorial or archival feel. Neither is fetched.

## Fluid scale

Eight steps, `clamp()`-based (Utopia, 320→1240px viewport). The body sits at
`--ad-step-0` — 18px on a phone, 20px on a wide screen — with no fixed
breakpoint in between.

{% for step in site.data.tokens.scale.typography.steps %}
<div class="ad-specimen">
  <div class="ad-specimen__meta">
    <span class="ad-token-name">{{ step.token | custom_property }}</span>
    <span>{{ step.px }}px</span>
    <span>{{ step.usage }}</span>
  </div>
  <div class="ad-specimen__sample" style="font-size: var({{ step.token | custom_property }});">
    The quick brown fox jumps over the lazy dog
  </div>
</div>
{% endfor %}

## The eight compound styles

Real, specific numbers from the source — not a generic ramp compressed to
fit. Each class sets family, size, weight, line-height, and (where the
source specifies one) letter-spacing in a single declaration.

<div class="ad-table-wrap">
  <table class="ad-table ad-table--compact">
    <thead><tr><th scope="col">Class</th><th scope="col">Weight</th><th scope="col">Size</th><th scope="col">Line-height</th><th scope="col">Tracking</th><th scope="col">Use for</th></tr></thead>
    <tbody>
      {%- for style in site.data.tokens.scale.typography.styles %}
      <tr>
        <td class="ad-token-name">.{{ style.class }}</td>
        <td>{{ style.weight }}</td>
        <td class="ad-table__code">{{ style.size | custom_property }}</td>
        <td>{{ style.line_height }}</td>
        <td>{{ style.tracking }}</td>
        <td>{{ style.usage }}</td>
      </tr>
      {%- endfor %}
    </tbody>
  </table>
</div>

{% example title="All eight, in order" layout="stack" %}
<div class="type-display">Display</div>
<h1 class="type-h1">Heading one</h1>
<h2 class="type-h2">Heading two</h2>
<h3 class="type-h3">Heading three</h3>
<p class="type-body">Body copy at the base size, 1.55 line-height.</p>
<p class="type-body-sm">Secondary copy, one step down.</p>
<span class="type-label">Catalog label</span>
<span class="type-mono">technical.value / 2026-08-21 / #3a6a63</span>
{% endexample %}

## Rules

- **Three families, and no fourth.** A new typeface needs a reason a weight
  or a size cannot supply.
- **Mono is not decoration.** Every label, meta value, ID, date, and code
  sample is mono — it is the one thread present in all three source projects.
- **`type-label` is always uppercase, mono, and tracked.** It is the one
  place uppercase belongs in this system.
- **Never set a size in `px`.** The eight steps are fluid on purpose.
