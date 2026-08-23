---
title: Typography
summary: >-
  Three families, eight fluid steps, eight compound styles. Sans for
  interface, mono for every label and technical value, serif as an opt-in
  reading variant.
---

## Families

<div class="ad-specimen">
  <div class="ad-specimen__meta">
    <code>--ad-font-sans</code>
    <span>Interface text — every component, every screen. Web-safe; nothing is loaded for it.</span>
  </div>
  <div class="ad-specimen__sample" style="font-family: var(--ad-font-sans); font-size: 1.5rem;">
    Arbitrary Definitions — 0123456789
  </div>
</div>
<div class="ad-specimen">
  <div class="ad-specimen__meta">
    <code>--ad-font-mono</code>
    <span>Every label, meta value, technical/catalog value, and code sample. The system's one loaded webfont.</span>
  </div>
  <div class="ad-specimen__sample" style="font-family: var(--ad-font-mono); font-size: 1.5rem;">
    Arbitrary Definitions — 0123456789
  </div>
</div>
<div class="ad-specimen">
  <div class="ad-specimen__meta">
    <code>--ad-font-serif</code>
    <span>Opt-in reading variant for a project that wants an editorial, archival feel. Not loaded by default; web-safe only.</span>
  </div>
  <div class="ad-specimen__sample" style="font-family: var(--ad-font-serif); font-size: 1.5rem;">
    Arbitrary Definitions — 0123456789
  </div>
</div>

Only one webfont is loaded — IBM Plex Mono, at 400/500/600:

```css
@import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Mono:wght@400;500;600&display=swap');
```

Sans is a web-safe system stack; serif is Georgia-based and opt-in, for a
project that wants an editorial or archival feel. Neither is fetched.

## Fluid scale

Eight steps, `clamp()`-based (Utopia, 320→1240px viewport). The body sits at
`--ad-step-0` — 18px on a phone, 20px on a wide screen — with no fixed
breakpoint in between.

<div class="ad-specimen">
  <div class="ad-specimen__meta">
    <code>--ad-step--2</code>
    <span>12.5 → 12.8px</span>
    <span>type-label — eyebrows, catalog labels, meta.</span>
  </div>
  <div class="ad-specimen__sample" style="font-size: var(--ad-step--2);">
    The quick brown fox jumps over the lazy dog
  </div>
</div>
<div class="ad-specimen">
  <div class="ad-specimen__meta">
    <code>--ad-step--1</code>
    <span>15 → 16px</span>
    <span>type-body-sm and type-mono — secondary copy, technical values.</span>
  </div>
  <div class="ad-specimen__sample" style="font-size: var(--ad-step--1);">
    The quick brown fox jumps over the lazy dog
  </div>
</div>
<div class="ad-specimen">
  <div class="ad-specimen__meta">
    <code>--ad-step-0</code>
    <span>18 → 20px</span>
    <span>type-body — the base size, and the body element's own size.</span>
  </div>
  <div class="ad-specimen__sample" style="font-size: var(--ad-step-0);">
    The quick brown fox jumps over the lazy dog
  </div>
</div>
<div class="ad-specimen">
  <div class="ad-specimen__meta">
    <code>--ad-step-1</code>
    <span>22 → 25px</span>
    <span>type-h3 — card and subsection headings.</span>
  </div>
  <div class="ad-specimen__sample" style="font-size: var(--ad-step-1);">
    The quick brown fox jumps over the lazy dog
  </div>
</div>
<div class="ad-specimen">
  <div class="ad-specimen__meta">
    <code>--ad-step-2</code>
    <span>26 → 31px</span>
    <span>type-h2 — section headings.</span>
  </div>
  <div class="ad-specimen__sample" style="font-size: var(--ad-step-2);">
    The quick brown fox jumps over the lazy dog
  </div>
</div>
<div class="ad-specimen">
  <div class="ad-specimen__meta">
    <code>--ad-step-3</code>
    <span>31 → 39px</span>
    <span>type-h1 — screen titles.</span>
  </div>
  <div class="ad-specimen__sample" style="font-size: var(--ad-step-3);">
    The quick brown fox jumps over the lazy dog
  </div>
</div>
<div class="ad-specimen">
  <div class="ad-specimen__meta">
    <code>--ad-step-4</code>
    <span>37 → 49px</span>
    <span>type-display — one hero title per screen, at most.</span>
  </div>
  <div class="ad-specimen__sample" style="font-size: var(--ad-step-4);">
    The quick brown fox jumps over the lazy dog
  </div>
</div>
<div class="ad-specimen">
  <div class="ad-specimen__meta">
    <code>--ad-step-5</code>
    <span>45 → 61px</span>
    <span>Reserved headroom. No compound style claims it yet.</span>
  </div>
  <div class="ad-specimen__sample" style="font-size: var(--ad-step-5);">
    The quick brown fox jumps over the lazy dog
  </div>
</div>

## The eight compound styles

Real, specific numbers — not a generic ramp compressed to fit. Each class
sets family, size, weight, line-height, and (where one applies)
letter-spacing in a single declaration.

  <table>
    <thead><tr><th scope="col">Class</th><th scope="col">Weight</th><th scope="col">Size</th><th scope="col">Line-height</th><th scope="col">Tracking</th><th scope="col">Use for</th></tr></thead>
    <tbody>
      <tr>
        <td><code>.type-display</code></td>
        <td>600</td>
        <td><code>--ad-step-4</code></td>
        <td>1.08</td>
        <td>-0.015em</td>
        <td>Page-level hero title, once per screen.</td>
      </tr>
      <tr>
        <td><code>.type-h1</code></td>
        <td>600</td>
        <td><code>--ad-step-3</code></td>
        <td>1.12</td>
        <td>-0.012em</td>
        <td>Screen title.</td>
      </tr>
      <tr>
        <td><code>.type-h2</code></td>
        <td>600</td>
        <td><code>--ad-step-2</code></td>
        <td>1.16</td>
        <td>-0.01em</td>
        <td>Section heading.</td>
      </tr>
      <tr>
        <td><code>.type-h3</code></td>
        <td>600</td>
        <td><code>--ad-step-1</code></td>
        <td>1.25</td>
        <td>normal</td>
        <td>Card / subsection heading.</td>
      </tr>
      <tr>
        <td><code>.type-body</code></td>
        <td>400</td>
        <td><code>--ad-step-0</code></td>
        <td>1.55</td>
        <td>normal</td>
        <td>Body copy.</td>
      </tr>
      <tr>
        <td><code>.type-body-sm</code></td>
        <td>400</td>
        <td><code>--ad-step--1</code></td>
        <td>1.5</td>
        <td>normal</td>
        <td>Secondary copy, hints.</td>
      </tr>
      <tr>
        <td><code>.type-label</code></td>
        <td>500</td>
        <td><code>--ad-step--2</code></td>
        <td>1</td>
        <td>0.08em</td>
        <td>Eyebrows, catalog labels, meta — SAVED, RECOMMENDED, OVERDUE.</td>
      </tr>
      <tr>
        <td><code>.type-mono</code></td>
        <td>400</td>
        <td><code>--ad-step--1</code></td>
        <td>1.5</td>
        <td>normal</td>
        <td>Technical values, IDs, dates, code.</td>
      </tr>
    </tbody>
  </table>

<figure class="example">
<figcaption>All eight, in order</figcaption>
<div data-layout="stack">
<div class="type-display">Display</div>
<h1 class="type-h1">Heading one</h1>
<h2 class="type-h2">Heading two</h2>
<h3 class="type-h3">Heading three</h3>
<p class="type-body">Body copy at the base size, 1.55 line-height.</p>
<p class="type-body-sm">Secondary copy, one step down.</p>
<span class="type-label">Catalog label</span>
<span class="type-mono">technical.value / 2026-08-21 / #3a6a63</span>
</div>
<details><summary>Markup</summary>
<pre><code>&lt;div class="type-display"&gt;Display&lt;/div&gt;
&lt;h1 class="type-h1"&gt;Heading one&lt;/h1&gt;
&lt;h2 class="type-h2"&gt;Heading two&lt;/h2&gt;
&lt;h3 class="type-h3"&gt;Heading three&lt;/h3&gt;
&lt;p class="type-body"&gt;Body copy at the base size, 1.55 line-height.&lt;/p&gt;
&lt;p class="type-body-sm"&gt;Secondary copy, one step down.&lt;/p&gt;
&lt;span class="type-label"&gt;Catalog label&lt;/span&gt;
&lt;span class="type-mono"&gt;technical.value / 2026-08-21 / #3a6a63&lt;/span&gt;</code></pre>
</details>
</figure>

## Rules

- **Three families, and no fourth.** A new typeface needs a reason a weight
  or a size cannot supply.
- **Mono is not decoration.** Every label, meta value, ID, date, and code
  sample is mono, consistently — not reserved for where code happens to
  appear.
- **`type-label` is always uppercase, mono, and tracked.** It is the one
  place uppercase belongs in this system.
- **Never set a size in `px`.** The eight steps are fluid on purpose.
