---
title: Button
summary: >-
  A flat, quiet button that recedes rather than performs — no gradients, no
  shine. Five variants, three sizes, one geometry.
---

## Variants

`default` is bordered and neutral. `primary` is the accent fill — one
committing action per view, at most. `dark` is reserved for the single most
committing action in a screen, typically a final Save; it should be rare.
`ghost` has no border or fill, for dismissals and tertiary actions. `danger`
is destructive and irreversible only.

<figure class="example">
<figcaption>Variants</figcaption>
<div>
<button type="button" class="ad-btn">Cancel</button>
<button type="button" class="ad-btn ad-btn--primary">Save</button>
<button type="button" class="ad-btn ad-btn--dark">Finish setup</button>
<button type="button" class="ad-btn ad-btn--ghost">Dismiss</button>
<button type="button" class="ad-btn ad-btn--danger">Delete</button>
</div>
<details open><summary>Markup</summary>
<pre><code>&lt;button type=&quot;button&quot; class=&quot;ad-btn&quot;&gt;Cancel&lt;/button&gt;
&lt;button type=&quot;button&quot; class=&quot;ad-btn ad-btn--primary&quot;&gt;Save&lt;/button&gt;
&lt;button type=&quot;button&quot; class=&quot;ad-btn ad-btn--dark&quot;&gt;Finish setup&lt;/button&gt;
&lt;button type=&quot;button&quot; class=&quot;ad-btn ad-btn--ghost&quot;&gt;Dismiss&lt;/button&gt;
&lt;button type=&quot;button&quot; class=&quot;ad-btn ad-btn--danger&quot;&gt;Delete&lt;/button&gt;</code></pre>
</details>
</figure>

## Sizes

Sizes adjust padding only — the font stays on the type scale, it does not
grow a step of its own.

<figure class="example">
<figcaption>Sizes</figcaption>
<div>
<button type="button" class="ad-btn ad-btn--primary ad-btn--sm">Small</button>
<button type="button" class="ad-btn ad-btn--primary">Medium</button>
<button type="button" class="ad-btn ad-btn--primary ad-btn--lg">Large</button>
</div>
<details><summary>Markup</summary>
<pre><code>&lt;button type=&quot;button&quot; class=&quot;ad-btn ad-btn--primary ad-btn--sm&quot;&gt;Small&lt;/button&gt;
&lt;button type=&quot;button&quot; class=&quot;ad-btn ad-btn--primary&quot;&gt;Medium&lt;/button&gt;
&lt;button type=&quot;button&quot; class=&quot;ad-btn ad-btn--primary ad-btn--lg&quot;&gt;Large&lt;/button&gt;</code></pre>
</details>
</figure>

## States

Disabled buttons drop to 50% opacity and keep their variant colors, so a
disabled primary still reads as the primary.

<figure class="example">
<figcaption>States</figcaption>
<div>
<button type="button" class="ad-btn ad-btn--primary" disabled="">Disabled</button>
<button type="button" class="ad-btn" aria-disabled="true">Not yet available</button>
</div>
<details><summary>Markup</summary>
<pre><code>&lt;button type=&quot;button&quot; class=&quot;ad-btn ad-btn--primary&quot; disabled=&quot;&quot;&gt;Disabled&lt;/button&gt;
&lt;button type=&quot;button&quot; class=&quot;ad-btn&quot; aria-disabled=&quot;true&quot;&gt;Not yet available&lt;/button&gt;</code></pre>
</details>
</figure>

<div class="ad-callout">
  <p class="type-label" style="margin-bottom: var(--ad-space-2xs); display:block;">disabled vs. aria-disabled</p>
  <p style="margin:0; font-size: var(--ad-step--1);">
    A <code>disabled</code> button is removed from the tab order, so a reader
    navigating by keyboard never learns it is there. When a button is
    temporarily unavailable and the reason matters, use
    <code>aria-disabled="true"</code> instead — it stays focusable and can
    carry an explanation.
  </p>
</div>

## With an icon

Pass an icon as the first child. The gap is `--ad-space-2xs`, set by the
button itself.

<figure class="example">
<figcaption>Icon</figcaption>
<div>
<button type="button" class="ad-btn ad-btn--primary">
  <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.9" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M12 5v14M5 12h14" /></svg>
  New
</button>
</div>
<details><summary>Markup</summary>
<pre><code>&lt;button type=&quot;button&quot; class=&quot;ad-btn ad-btn--primary&quot;&gt;
  &lt;svg width=&quot;14&quot; height=&quot;14&quot; viewBox=&quot;0 0 24 24&quot; fill=&quot;none&quot; stroke=&quot;currentColor&quot; stroke-width=&quot;1.9&quot; stroke-linecap=&quot;round&quot; stroke-linejoin=&quot;round&quot; aria-hidden=&quot;true&quot;&gt;&lt;path d=&quot;M12 5v14M5 12h14&quot; /&gt;&lt;/svg&gt;
  New
&lt;/button&gt;</code></pre>
</details>
</figure>

## Groups

<figure class="example">
<figcaption>Button group</figcaption>
<div>
<div class="ad-btn-group" role="group" aria-label="View">
  <button type="button" class="ad-btn ad-btn--sm">List</button>
  <button type="button" class="ad-btn ad-btn--sm">Board</button>
  <button type="button" class="ad-btn ad-btn--sm">Calendar</button>
</div>
</div>
<details><summary>Markup</summary>
<pre><code>&lt;div class=&quot;ad-btn-group&quot; role=&quot;group&quot; aria-label=&quot;View&quot;&gt;
  &lt;button type=&quot;button&quot; class=&quot;ad-btn ad-btn--sm&quot;&gt;List&lt;/button&gt;
  &lt;button type=&quot;button&quot; class=&quot;ad-btn ad-btn--sm&quot;&gt;Board&lt;/button&gt;
  &lt;button type=&quot;button&quot; class=&quot;ad-btn ad-btn--sm&quot;&gt;Calendar&lt;/button&gt;
&lt;/div&gt;</code></pre>
</details>
</figure>

## Full width

<figure class="example">
<figcaption>Block</figcaption>
<div data-layout="stack">
<button type="button" class="ad-btn ad-btn--primary ad-btn--block">Take a photo</button>
</div>
<details><summary>Markup</summary>
<pre><code>&lt;button type=&quot;button&quot; class=&quot;ad-btn ad-btn--primary ad-btn--block&quot;&gt;Take a photo&lt;/button&gt;</code></pre>
</details>
</figure>

## Links that act like buttons

An `<a>` with `.ad-btn` is fine when the thing it does is navigate. A
`<button>` is required when it changes something.

<figure class="example">
<figcaption>Anchor as button</figcaption>
<div>
<a class="ad-btn ad-btn--primary" href="/arbitrary-definitions-design-system/components/icon-button/">Next: IconButton</a>
<a class="ad-btn ad-btn--ghost" href="/arbitrary-definitions-design-system/foundations/color/">Back to color</a>
</div>
<details><summary>Markup</summary>
<pre><code>&lt;a class=&quot;ad-btn ad-btn--primary&quot; href=&quot;/arbitrary-definitions-design-system/components/icon-button/&quot;&gt;Next: IconButton&lt;/a&gt;
&lt;a class=&quot;ad-btn ad-btn--ghost&quot; href=&quot;/arbitrary-definitions-design-system/foundations/color/&quot;&gt;Back to color&lt;/a&gt;</code></pre>
</details>
</figure>

## API

<div class="ad-table-wrap">
  <table class="ad-table ad-table--compact">
    <thead><tr><th scope="col">Prop</th><th scope="col">Type</th><th scope="col">Notes</th></tr></thead>
    <tbody>
      <tr><td class="ad-token-name">variant</td><td class="ad-table__code">default | primary | dark | ghost | danger</td><td>Default <code>default</code>.</td></tr>
      <tr><td class="ad-token-name">size</td><td class="ad-table__code">sm | md | lg</td><td>Padding only.</td></tr>
      <tr><td class="ad-token-name">icon</td><td class="ad-table__code">node</td><td>Rendered before the label.</td></tr>
      <tr><td class="ad-token-name">disabled</td><td class="ad-table__code">boolean</td><td>Removes the button from the tab order.</td></tr>
    </tbody>
  </table>
</div>

<div class="ad-table-wrap">
  <table class="ad-table ad-table--compact">
    <thead><tr><th scope="col">Class</th><th scope="col">Effect</th></tr></thead>
    <tbody>
      <tr><td class="ad-token-name">.ad-btn</td><td>Required base. Sets geometry, focus, and transitions.</td></tr>
      <tr><td class="ad-token-name">.ad-btn--primary / --dark / --ghost / --danger</td><td>Variant fills.</td></tr>
      <tr><td class="ad-token-name">.ad-btn--sm / --lg</td><td>Height, padding, and font size in one step.</td></tr>
      <tr><td class="ad-token-name">.ad-btn--block</td><td>Full width of its container.</td></tr>
    </tbody>
  </table>
</div>
