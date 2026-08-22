---
title: CardRow
summary: >-
  A hairline-divided list row for use inside Card — entry lists, task lists,
  settings rows. The first row's top border removes itself automatically.
---

CardRow is a bare `<li>` inside a `<ul class="card">` — the divider styling
comes entirely from the `.card > li` descendant selector, so there is no
class of CardRow's own.

## Basic

<figure class="example">
<figcaption>Rows</figcaption>
<div>
<ul class="card" style="max-width: 22rem;">
  <li>Renew passport</li>
  <li>Dentist checkup</li>
  <li>Rotate mattress</li>
</ul>
</div>
<details open><summary>Markup</summary>
<pre><code>&lt;ul class=&quot;card&quot; style=&quot;max-width: 22rem;&quot;&gt;
  &lt;li&gt;Renew passport&lt;/li&gt;
  &lt;li&gt;Dentist checkup&lt;/li&gt;
  &lt;li&gt;Rotate mattress&lt;/li&gt;
&lt;/ul&gt;</code></pre>
</details>
</figure>

## Clickable

Wrap the row's content in a real `<button>` or `<a>` when the row navigates
or opens something — an accessible clickable row, not a `<li>` with a click
handler and no keyboard support. It fills the row edge-to-edge and picks up
a hover fill on its own; no `--clickable` modifier to remember.

<figure class="example">
<figcaption>Clickable rows</figcaption>
<div>
<ul class="card" style="max-width: 22rem;">
  <li><button>Tax return 2025.pdf</button></li>
  <li><button>Warranty card.pdf</button></li>
</ul>
</div>
<details><summary>Markup</summary>
<pre><code>&lt;ul class=&quot;card&quot; style=&quot;max-width: 22rem;&quot;&gt;
  &lt;li&gt;&lt;button&gt;Tax return 2025.pdf&lt;/button&gt;&lt;/li&gt;
  &lt;li&gt;&lt;button&gt;Warranty card.pdf&lt;/button&gt;&lt;/li&gt;
&lt;/ul&gt;</code></pre>
</details>
</figure>

## With content on both ends

The row is a flex container — a leading icon, a two-line middle column, and a
trailing mono value is the most common shape (see the Loop and Archive
patterns for it in context).

<figure class="example">
<figcaption>Leading icon, trailing meta</figcaption>
<div>
<ul class="card" style="max-width: 24rem;">
  <li>
    <span class="avatar" data-square>
      <svg width="17" height="17" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M21 8 12 3 3 8v8l9 5 9-5V8Z" /><path d="M3 8l9 5 9-5M12 13v8" /></svg>
    </span>
    <div style="flex:1; min-width:0;">
      <div style="font-weight: 550;">Dishwasher manual</div>
      <div class="type-label" style="margin-top: 2px;">PDF · 2.1MB</div>
    </div>
    <span class="type-mono" style="color: var(--ad-color-text-tertiary);">2h</span>
  </li>
</ul>
</div>
<details><summary>Markup</summary>
<pre><code>&lt;ul class=&quot;card&quot; style=&quot;max-width: 24rem;&quot;&gt;
  &lt;li&gt;
    &lt;span class=&quot;avatar&quot; data-square&gt;
      &lt;svg width=&quot;17&quot; height=&quot;17&quot; viewBox=&quot;0 0 24 24&quot; fill=&quot;none&quot; stroke=&quot;currentColor&quot; stroke-width=&quot;1.75&quot; stroke-linecap=&quot;round&quot; stroke-linejoin=&quot;round&quot; aria-hidden=&quot;true&quot;&gt;&lt;path d=&quot;M21 8 12 3 3 8v8l9 5 9-5V8Z&quot; /&gt;&lt;path d=&quot;M3 8l9 5 9-5M12 13v8&quot; /&gt;&lt;/svg&gt;
    &lt;/span&gt;
    &lt;div style=&quot;flex:1; min-width:0;&quot;&gt;
      &lt;div style=&quot;font-weight: 550;&quot;&gt;Dishwasher manual&lt;/div&gt;
      &lt;div class=&quot;type-label&quot; style=&quot;margin-top: 2px;&quot;&gt;PDF · 2.1MB&lt;/div&gt;
    &lt;/div&gt;
    &lt;span class=&quot;type-mono&quot; style=&quot;color: var(--ad-color-text-tertiary);&quot;&gt;2h&lt;/span&gt;
  &lt;/li&gt;
&lt;/ul&gt;</code></pre>
</details>
</figure>

## API

<table>
  <thead><tr><th scope="col">Element / attribute</th><th scope="col">Values</th><th scope="col">Notes</th></tr></thead>
  <tbody>
    <tr><td><code>li</code></td><td></td><td>Required — a direct child of <code>ul.card</code>. No class of its own.</td></tr>
    <tr><td><code>li &gt; button</code> / <code>li &gt; a</code></td><td></td><td>Wrap the row's content to make it clickable, in place of an <code>onClick</code> prop.</td></tr>
  </tbody>
</table>
