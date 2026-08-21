---
title: CardRow
summary: >-
  A hairline-divided list row for use inside Card — entry lists, task lists,
  settings rows. The first row's top border removes itself automatically.
---

## Basic

<figure class="example">
<figcaption>Rows</figcaption>
<div>
<div class="ad-card" style="max-width: 22rem;">
  <div class="ad-card-row">Renew passport</div>
  <div class="ad-card-row">Dentist checkup</div>
  <div class="ad-card-row">Rotate mattress</div>
</div>
</div>
<details open><summary>Markup</summary>
<pre><code>&lt;div class=&quot;ad-card&quot; style=&quot;max-width: 22rem;&quot;&gt;
  &lt;div class=&quot;ad-card-row&quot;&gt;Renew passport&lt;/div&gt;
  &lt;div class=&quot;ad-card-row&quot;&gt;Dentist checkup&lt;/div&gt;
  &lt;div class=&quot;ad-card-row&quot;&gt;Rotate mattress&lt;/div&gt;
&lt;/div&gt;</code></pre>
</details>
</figure>

## Clickable

`--clickable` adds a hover fill and a pointer cursor. Use a real `<button>`
element when the row navigates or opens something.

<figure class="example">
<figcaption>Clickable rows</figcaption>
<div>
<div class="ad-card" style="max-width: 22rem;">
  <button type="button" class="ad-card-row ad-card-row--clickable">Tax return 2025.pdf</button>
  <button type="button" class="ad-card-row ad-card-row--clickable">Warranty card.pdf</button>
</div>
</div>
<details><summary>Markup</summary>
<pre><code>&lt;div class=&quot;ad-card&quot; style=&quot;max-width: 22rem;&quot;&gt;
  &lt;button type=&quot;button&quot; class=&quot;ad-card-row ad-card-row--clickable&quot;&gt;Tax return 2025.pdf&lt;/button&gt;
  &lt;button type=&quot;button&quot; class=&quot;ad-card-row ad-card-row--clickable&quot;&gt;Warranty card.pdf&lt;/button&gt;
&lt;/div&gt;</code></pre>
</details>
</figure>

## With content on both ends

The row is a flex container — a leading icon, a two-line middle column, and a
trailing mono value is the most common shape (see the Loop and Archive
patterns for it in context).

<figure class="example">
<figcaption>Leading icon, trailing meta</figcaption>
<div>
<div class="ad-card" style="max-width: 24rem;">
  <div class="ad-card-row">
    <span class="ad-avatar ad-avatar--square">
      <svg width="17" height="17" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M21 8 12 3 3 8v8l9 5 9-5V8Z" /><path d="M3 8l9 5 9-5M12 13v8" /></svg>
    </span>
    <div style="flex:1; min-width:0;">
      <div style="font-weight: 550;">Dishwasher manual</div>
      <div class="type-label" style="margin-top: 2px;">PDF · 2.1MB</div>
    </div>
    <span class="type-mono" style="color: var(--ad-color-text-tertiary);">2h</span>
  </div>
</div>
</div>
<details><summary>Markup</summary>
<pre><code>&lt;div class=&quot;ad-card&quot; style=&quot;max-width: 24rem;&quot;&gt;
  &lt;div class=&quot;ad-card-row&quot;&gt;
    &lt;span class=&quot;ad-avatar ad-avatar--square&quot;&gt;
      &lt;svg width=&quot;17&quot; height=&quot;17&quot; viewBox=&quot;0 0 24 24&quot; fill=&quot;none&quot; stroke=&quot;currentColor&quot; stroke-width=&quot;1.75&quot; stroke-linecap=&quot;round&quot; stroke-linejoin=&quot;round&quot; aria-hidden=&quot;true&quot;&gt;&lt;path d=&quot;M21 8 12 3 3 8v8l9 5 9-5V8Z&quot; /&gt;&lt;path d=&quot;M3 8l9 5 9-5M12 13v8&quot; /&gt;&lt;/svg&gt;
    &lt;/span&gt;
    &lt;div style=&quot;flex:1; min-width:0;&quot;&gt;
      &lt;div style=&quot;font-weight: 550;&quot;&gt;Dishwasher manual&lt;/div&gt;
      &lt;div class=&quot;type-label&quot; style=&quot;margin-top: 2px;&quot;&gt;PDF · 2.1MB&lt;/div&gt;
    &lt;/div&gt;
    &lt;span class=&quot;type-mono&quot; style=&quot;color: var(--ad-color-text-tertiary);&quot;&gt;2h&lt;/span&gt;
  &lt;/div&gt;
&lt;/div&gt;</code></pre>
</details>
</figure>

## API

<div class="ad-table-wrap">
  <table class="ad-table ad-table--compact">
    <thead><tr><th scope="col">Prop</th><th scope="col">Type</th><th scope="col">Notes</th></tr></thead>
    <tbody>
      <tr><td class="ad-token-name">onClick</td><td class="ad-table__code">function</td><td>Reach for <code>.ad-card-row--clickable</code> and a <code>&lt;button&gt;</code>.</td></tr>
    </tbody>
  </table>
</div>
