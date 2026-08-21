---
title: IconButton
summary: >-
  A square icon-only button. Always pass a label — it becomes the accessible
  name and the native tooltip, since there is no visible text to fall back on.
---

## Variants

`ghost` is the default and transparent. `outline` is a bordered surface, for
an icon button sitting alone rather than in a toolbar. `accent` is a soft
accent tint, for a toggled or active state — the segmented-tabs pattern this
system does not otherwise reach for.

A square icon-only button is still a `<button>`, but there is no attribute
that tells it apart from a plain [Button](<%= relative_url('/components/button/') %>)
sitting alone — `variant`/`size` mean different things for each — so
`.icon-button` is the one class this component needs.

<figure class="example">
<figcaption>Variants</figcaption>
<div>
<button class="icon-button" aria-label="Delete">
  <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M4 7h16M9 7V4h6v3M6 7l1 13h10l1-13" /></svg>
</button>
<button class="icon-button" data-variant="outline" aria-label="Settings">
  <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><circle cx="12" cy="12" r="3" /><path d="M12 2.5v3M12 18.5v3M3.6 7.2l2.6 1.5M17.8 15.3l2.6 1.5M3.6 16.8l2.6-1.5M17.8 8.7l2.6-1.5" /></svg>
</button>
<button class="icon-button" data-variant="accent" aria-label="Filter (active)">
  <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M4 5h16l-6 8v5l-4 2v-7z" /></svg>
</button>
</div>
<details open><summary>Markup</summary>
<pre><code>&lt;button type=&quot;button&quot; class=&quot;icon-button&quot; aria-label=&quot;Delete&quot;&gt;
  &lt;svg width=&quot;16&quot; height=&quot;16&quot; viewBox=&quot;0 0 24 24&quot; fill=&quot;none&quot; stroke=&quot;currentColor&quot; stroke-width=&quot;1.75&quot; stroke-linecap=&quot;round&quot; stroke-linejoin=&quot;round&quot; aria-hidden=&quot;true&quot;&gt;&lt;path d=&quot;M4 7h16M9 7V4h6v3M6 7l1 13h10l1-13&quot; /&gt;&lt;/svg&gt;
&lt;/button&gt;
&lt;button type=&quot;button&quot; class=&quot;icon-button&quot; data-variant=&quot;outline&quot; aria-label=&quot;Settings&quot;&gt;
  &lt;svg width=&quot;16&quot; height=&quot;16&quot; viewBox=&quot;0 0 24 24&quot; fill=&quot;none&quot; stroke=&quot;currentColor&quot; stroke-width=&quot;1.75&quot; stroke-linecap=&quot;round&quot; stroke-linejoin=&quot;round&quot; aria-hidden=&quot;true&quot;&gt;&lt;circle cx=&quot;12&quot; cy=&quot;12&quot; r=&quot;3&quot; /&gt;&lt;path d=&quot;M12 2.5v3M12 18.5v3M3.6 7.2l2.6 1.5M17.8 15.3l2.6 1.5M3.6 16.8l2.6-1.5M17.8 8.7l2.6-1.5&quot; /&gt;&lt;/svg&gt;
&lt;/button&gt;
&lt;button type=&quot;button&quot; class=&quot;icon-button&quot; data-variant=&quot;accent&quot; aria-label=&quot;Filter (active)&quot;&gt;
  &lt;svg width=&quot;16&quot; height=&quot;16&quot; viewBox=&quot;0 0 24 24&quot; fill=&quot;none&quot; stroke=&quot;currentColor&quot; stroke-width=&quot;1.75&quot; stroke-linecap=&quot;round&quot; stroke-linejoin=&quot;round&quot; aria-hidden=&quot;true&quot;&gt;&lt;path d=&quot;M4 5h16l-6 8v5l-4 2v-7z&quot; /&gt;&lt;/svg&gt;
&lt;/button&gt;</code></pre>
</details>
</figure>

## Sizes

<figure class="example">
<figcaption>Sizes</figcaption>
<div>
<button class="icon-button" data-variant="outline" data-size="sm" aria-label="Back"><svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.9" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M15 18l-6-6 6-6" /></svg></button>
<button class="icon-button" data-variant="outline" aria-label="Back"><svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.9" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M15 18l-6-6 6-6" /></svg></button>
<button class="icon-button" data-variant="outline" data-size="lg" aria-label="Back"><svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.9" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M15 18l-6-6 6-6" /></svg></button>
</div>
<details><summary>Markup</summary>
<pre><code>&lt;button type=&quot;button&quot; class=&quot;icon-button&quot; data-variant=&quot;outline&quot; data-size=&quot;sm&quot; aria-label=&quot;Back&quot;&gt;&lt;svg width=&quot;14&quot; height=&quot;14&quot; viewBox=&quot;0 0 24 24&quot; fill=&quot;none&quot; stroke=&quot;currentColor&quot; stroke-width=&quot;1.9&quot; stroke-linecap=&quot;round&quot; stroke-linejoin=&quot;round&quot; aria-hidden=&quot;true&quot;&gt;&lt;path d=&quot;M15 18l-6-6 6-6&quot; /&gt;&lt;/svg&gt;&lt;/button&gt;
&lt;button type=&quot;button&quot; class=&quot;icon-button&quot; data-variant=&quot;outline&quot; aria-label=&quot;Back&quot;&gt;&lt;svg width=&quot;16&quot; height=&quot;16&quot; viewBox=&quot;0 0 24 24&quot; fill=&quot;none&quot; stroke=&quot;currentColor&quot; stroke-width=&quot;1.9&quot; stroke-linecap=&quot;round&quot; stroke-linejoin=&quot;round&quot; aria-hidden=&quot;true&quot;&gt;&lt;path d=&quot;M15 18l-6-6 6-6&quot; /&gt;&lt;/svg&gt;&lt;/button&gt;
&lt;button type=&quot;button&quot; class=&quot;icon-button&quot; data-variant=&quot;outline&quot; data-size=&quot;lg&quot; aria-label=&quot;Back&quot;&gt;&lt;svg width=&quot;18&quot; height=&quot;18&quot; viewBox=&quot;0 0 24 24&quot; fill=&quot;none&quot; stroke=&quot;currentColor&quot; stroke-width=&quot;1.9&quot; stroke-linecap=&quot;round&quot; stroke-linejoin=&quot;round&quot; aria-hidden=&quot;true&quot;&gt;&lt;path d=&quot;M15 18l-6-6 6-6&quot; /&gt;&lt;/svg&gt;&lt;/button&gt;</code></pre>
</details>
</figure>

## Paired with Tooltip

An icon-only control almost always wants a [Tooltip](<%= relative_url('/components/tooltip/') %>) too — the `aria-label` covers accessibility, the tooltip covers a sighted mouse user glancing for a hint.

<figure class="example">
<figcaption>With a tooltip</figcaption>
<div>
<span>
  <button class="icon-button" aria-label="Delete" aria-describedby="icon-btn-tip">
    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M4 7h16M9 7V4h6v3M6 7l1 13h10l1-13" /></svg>
  </button>
  <span role="tooltip" id="icon-btn-tip">Delete</span>
</span>
</div>
<details><summary>Markup</summary>
<pre><code>&lt;span&gt;
  &lt;button type=&quot;button&quot; class=&quot;icon-button&quot; aria-label=&quot;Delete&quot; aria-describedby=&quot;icon-btn-tip&quot;&gt;
    &lt;svg width=&quot;16&quot; height=&quot;16&quot; viewBox=&quot;0 0 24 24&quot; fill=&quot;none&quot; stroke=&quot;currentColor&quot; stroke-width=&quot;1.75&quot; stroke-linecap=&quot;round&quot; stroke-linejoin=&quot;round&quot; aria-hidden=&quot;true&quot;&gt;&lt;path d=&quot;M4 7h16M9 7V4h6v3M6 7l1 13h10l1-13&quot; /&gt;&lt;/svg&gt;
  &lt;/button&gt;
  &lt;span role=&quot;tooltip&quot; id=&quot;icon-btn-tip&quot;&gt;Delete&lt;/span&gt;
&lt;/span&gt;</code></pre>
</details>
</figure>

## API

<table>
  <thead><tr><th scope="col">Element / attribute</th><th scope="col">Values</th><th scope="col">Notes</th></tr></thead>
  <tbody>
    <tr><td><code>button.icon-button</code></td><td></td><td>Required base — the one class in this component, since nothing distinguishes it from Button structurally.</td></tr>
    <tr><td><code>aria-label</code></td><td>string</td><td>Required — becomes the accessible name and the native tooltip.</td></tr>
    <tr><td><code>data-size</code></td><td><code>sm | lg</code></td><td>28 / 40px square. Omit for the default 34px.</td></tr>
    <tr><td><code>data-variant</code></td><td><code>outline | accent</code></td><td>Omit for the default, transparent ghost look.</td></tr>
  </tbody>
</table>
