---
title: Space
summary: >-
  Nine fluid Utopia steps, 3xs through 3xl — the same clamp() config as type,
  because there is no fixed base unit here to count multiples of.
---

## The scale

<div class="ad-ruler">
  <div class="ad-ruler__row">
    <code>space-3xs</code>
    <span class="ad-ruler__num">5px</span>
    <span class="ad-ruler__bar" style="width: clamp(0.3125rem, 0.3125rem + 0vw, 0.3125rem); min-width: 1px;"></span>
  </div>
  <div class="ad-ruler__row">
    <code>space-2xs</code>
    <span class="ad-ruler__num">9 → 10px</span>
    <span class="ad-ruler__bar" style="width: clamp(0.5625rem, 0.5369rem + 0.1136vw, 0.625rem); min-width: 1px;"></span>
  </div>
  <div class="ad-ruler__row">
    <code>space-xs</code>
    <span class="ad-ruler__num">14 → 15px</span>
    <span class="ad-ruler__bar" style="width: clamp(0.875rem, 0.8494rem + 0.1136vw, 0.9375rem); min-width: 1px;"></span>
  </div>
  <div class="ad-ruler__row">
    <code>space-s</code>
    <span class="ad-ruler__num">18 → 20px</span>
    <span class="ad-ruler__bar" style="width: clamp(1.125rem, 1.0739rem + 0.2273vw, 1.25rem); min-width: 1px;"></span>
  </div>
  <div class="ad-ruler__row">
    <code>space-m</code>
    <span class="ad-ruler__num">27 → 30px</span>
    <span class="ad-ruler__bar" style="width: clamp(1.6875rem, 1.6108rem + 0.3409vw, 1.875rem); min-width: 1px;"></span>
  </div>
  <div class="ad-ruler__row">
    <code>space-l</code>
    <span class="ad-ruler__num">36 → 40px</span>
    <span class="ad-ruler__bar" style="width: clamp(2.25rem, 2.1477rem + 0.4545vw, 2.5rem); min-width: 1px;"></span>
  </div>
  <div class="ad-ruler__row">
    <code>space-xl</code>
    <span class="ad-ruler__num">54 → 60px</span>
    <span class="ad-ruler__bar" style="width: clamp(3.375rem, 3.2216rem + 0.6818vw, 3.75rem); min-width: 1px;"></span>
  </div>
  <div class="ad-ruler__row">
    <code>space-2xl</code>
    <span class="ad-ruler__num">72 → 80px</span>
    <span class="ad-ruler__bar" style="width: clamp(4.5rem, 4.2955rem + 0.9091vw, 5rem); min-width: 1px;"></span>
  </div>
  <div class="ad-ruler__row">
    <code>space-3xl</code>
    <span class="ad-ruler__num">108 → 120px</span>
    <span class="ad-ruler__bar" style="width: clamp(6.75rem, 6.4432rem + 1.3636vw, 7.5rem); min-width: 1px;"></span>
  </div>
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

<figure class="example">
<figcaption>The same card at three densities</figcaption>
<div data-layout="grid">
<article class="card">
  <div class="card-body" style="gap: var(--ad-space-3xs); padding: var(--ad-space-xs);">
    <h3 style="font-size: var(--ad-step--1);">Compact</h3>
    <p>space-xs padding, space-3xs gap. For dense lists.</p>
  </div>
</article>
<article class="card">
  <div class="card-body">
    <h3 style="font-size: var(--ad-step--1);">Default</h3>
    <p>space-m padding, space-2xs gap. What Card ships with.</p>
  </div>
</article>
<article class="card">
  <div class="card-body" style="gap: var(--ad-space-s); padding: var(--ad-space-l);">
    <h3 style="font-size: var(--ad-step--1);">Roomy</h3>
    <p>space-l padding, space-s gap. For a card that is the whole screen.</p>
  </div>
</article>
</div>
<details><summary>Markup</summary>
<pre><code>&lt;article class="card"&gt;
  &lt;div class="card-body" style="gap: var(--ad-space-3xs); padding: var(--ad-space-xs);"&gt;
    &lt;h3&gt;Compact&lt;/h3&gt;
    &lt;p&gt;space-xs padding, space-3xs gap. For dense lists.&lt;/p&gt;
  &lt;/div&gt;
&lt;/article&gt;
&lt;article class="card"&gt;
  &lt;div class="card-body"&gt;
    &lt;h3&gt;Default&lt;/h3&gt;
    &lt;p&gt;space-m padding, space-2xs gap. What Card ships with.&lt;/p&gt;
  &lt;/div&gt;
&lt;/article&gt;
&lt;article class="card"&gt;
  &lt;div class="card-body" style="gap: var(--ad-space-s); padding: var(--ad-space-l);"&gt;
    &lt;h3&gt;Roomy&lt;/h3&gt;
    &lt;p&gt;space-l padding, space-s gap. For a card that is the whole screen.&lt;/p&gt;
  &lt;/div&gt;
&lt;/article&gt;</code></pre>
</details>
</figure>

## Radius

4/6/10px — small and quiet, kept modest so it reads as a neutral default
rather than a decorative flourish. Nothing pill-shaped except true pills.

<ul class="ad-radius-grid">
  <li>
    <div class="ad-radius-demo" style="border-radius: 4px;"></div>
    <div class="ad-specimen__meta">
      <code>radius-sm</code>
      <span>4px</span>
    </div>
    <p class="ad-muted" style="font-size: var(--ad-step--2); margin: var(--ad-space-3xs) 0 0;">Buttons, inputs, badges, tags.</p>
  </li>
  <li>
    <div class="ad-radius-demo" style="border-radius: 6px;"></div>
    <div class="ad-specimen__meta">
      <code>radius-md</code>
      <span>6px</span>
    </div>
    <p class="ad-muted" style="font-size: var(--ad-step--2); margin: var(--ad-space-3xs) 0 0;">IconButton, the segmented-tabs track, avatar chips.</p>
  </li>
  <li>
    <div class="ad-radius-demo" style="border-radius: 10px;"></div>
    <div class="ad-specimen__meta">
      <code>radius-lg</code>
      <span>10px</span>
    </div>
    <p class="ad-muted" style="font-size: var(--ad-step--2); margin: var(--ad-space-3xs) 0 0;">Cards, dialogs, toasts, photo slots — the system's "surface" radius.</p>
  </li>
  <li>
    <div class="ad-radius-demo" style="border-radius: 999px;"></div>
    <div class="ad-specimen__meta">
      <code>radius-full</code>
      <span>999px</span>
    </div>
    <p class="ad-muted" style="font-size: var(--ad-step--2); margin: var(--ad-space-3xs) 0 0;">True pills only — Badge, Tag, Switch, round avatars.</p>
  </li>
</ul>

## Rules

- **Space comes from the parent.** A component sets its own internal padding
  and never its external margin; the layout that contains it owns the gap.
- **Use `gap`.** Flex and grid gaps do not collapse and do not need a
  `:last-child` reset.
- **A value not on the scale is a bug**, not a nudge. If a gap looks wrong,
  the scale is wrong and should change for everybody.
