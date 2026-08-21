---
title: Elevation
summary: >-
  Two shadow levels only. Hairline (1px) borders do most of the elevation
  work in this system; shadow is reserved for the one floating layer in a view.
---

## Borders do the work

The source's own rule: "hairline (1px) borders and dividers do most of the
elevation work". A flat, bordered [Card](<%= relative_url('/components/card/') %>)
is the default everywhere. Shadow is the exception, not the baseline.

## The two levels

<ul class="ad-elevation-grid">
  <li>
    <div class="ad-elevation-demo" style="box-shadow: 0 1px 2px rgba(20, 18, 14, 0.05);"></div>
    <div class="ad-specimen__meta"><span class="ad-token-name">shadow-sm</span></div>
    <p class="ad-muted" style="font-size: var(--ad-step--2); margin: var(--ad-space-3xs) 0 0;">Barely-there separation — a Switch thumb, a focused Input.</p>
  </li>
  <li>
    <div class="ad-elevation-demo" style="box-shadow: 0 2px 6px rgba(20, 18, 14, 0.06), 0 10px 24px -12px rgba(20, 18, 14, 0.18);"></div>
    <div class="ad-specimen__meta"><span class="ad-token-name">shadow-float</span></div>
    <p class="ad-muted" style="font-size: var(--ad-step--2); margin: var(--ad-space-3xs) 0 0;">The one floating layer in a view. Apply it to at most one element on screen at a time.</p>
  </li>
</ul>

<figure class="example">
<figcaption>Flat vs. float</figcaption>
<div data-layout="grid" data-surface="sunken">
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
</div>
<details><summary>Markup</summary>
<pre><code>&lt;article class="ad-card"&gt;
  &lt;div class="ad-card__body"&gt;
    &lt;h3 class="ad-card__title" style="font-size: var(--ad-step--1);"&gt;Flat&lt;/h3&gt;
    &lt;p class="ad-card__text"&gt;The default. A hairline border, no shadow.&lt;/p&gt;
  &lt;/div&gt;
&lt;/article&gt;
&lt;article class="ad-card ad-card--elevated"&gt;
  &lt;div class="ad-card__body"&gt;
    &lt;h3 class="ad-card__title" style="font-size: var(--ad-step--1);"&gt;Elevated&lt;/h3&gt;
    &lt;p class="ad-card__text"&gt;shadow-float. Reserved for one element per view — a Dialog, a Toast.&lt;/p&gt;
  &lt;/div&gt;
&lt;/article&gt;</code></pre>
</details>
</figure>

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
