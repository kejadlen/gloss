---
title: Elevation
summary: >-
  Two shadow levels only. Hairline (1px) borders do most of the elevation
  work in this system; shadow is reserved for the one floating layer in a view.
---

## Borders do the work

This system's own rule: hairline (1px) borders and dividers do most of the
elevation work. A flat, bordered [Card](<%= relative_url('/components/card/') %>)
is the default everywhere. Shadow is the exception, not the baseline.

## The two levels

<ul class="gl-elevation-grid">
  <li>
    <div class="gl-elevation-demo" style="box-shadow: 0 1px 2px rgba(20, 18, 14, 0.05);"></div>
    <div class="gl-specimen__meta"><code>shadow-sm</code></div>
    <p class="gl-muted" style="font-size: var(--gl-step--2); margin: var(--gl-space-3xs) 0 0;">Barely-there separation — a Switch thumb, a focused Input.</p>
  </li>
  <li>
    <div class="gl-elevation-demo" style="box-shadow: 0 2px 6px rgba(20, 18, 14, 0.06), 0 10px 24px -12px rgba(20, 18, 14, 0.18);"></div>
    <div class="gl-specimen__meta"><code>shadow-float</code></div>
    <p class="gl-muted" style="font-size: var(--gl-step--2); margin: var(--gl-space-3xs) 0 0;">The one floating layer in a view. Apply it to at most one element on screen at a time.</p>
  </li>
</ul>

<figure class="example">
<figcaption>Flat vs. float</figcaption>
<div data-layout="grid" data-surface="sunken">
<article class="card">
  <div class="card-body">
    <h3 style="font-size: var(--gl-step--1);">Flat</h3>
    <p>The default. A hairline border, no shadow.</p>
  </div>
</article>
<article class="card" data-elevated>
  <div class="card-body">
    <h3 style="font-size: var(--gl-step--1);">Elevated</h3>
    <p>shadow-float. Reserved for one element per view — a Dialog, a Toast.</p>
  </div>
</article>
</div>
<details><summary>Markup</summary>
<pre><code>&lt;article class="card"&gt;
  &lt;div class="card-body"&gt;
    &lt;h3&gt;Flat&lt;/h3&gt;
    &lt;p&gt;The default. A hairline border, no shadow.&lt;/p&gt;
  &lt;/div&gt;
&lt;/article&gt;
&lt;article class="card" data-elevated&gt;
  &lt;div class="card-body"&gt;
    &lt;h3&gt;Elevated&lt;/h3&gt;
    &lt;p&gt;shadow-float. Reserved for one element per view — a Dialog, a Toast.&lt;/p&gt;
  &lt;/div&gt;
&lt;/article&gt;</code></pre>
</details>
</figure>

## Elevation in the dark theme

Shadows barely register on a near-black surface. The dark theme leans on
surface lightness instead — `--gl-color-surface-card` is one neutral step
lighter than `--gl-color-surface-page`, same as in light mode. The shadow
tokens still apply; they simply stop being the primary signal.

## Rules

- **At most one `--gl-shadow-float` on screen.** If two things both claim to
  be the topmost layer, neither is.
- **Border or shadow, not both, for a given surface's edge.** A card that
  both borders and floats looks like a sticker.
- **Never animate a shadow's blur.** If a floated element needs to arrive,
  animate its `opacity`, or do not animate it at all.
