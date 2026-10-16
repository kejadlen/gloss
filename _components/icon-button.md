---
title: IconButton
summary: >-
  A square icon-only button. Always pass a label — it becomes the accessible
  name and the native tooltip, since there is no visible text to fall back on.
---

## Variants

`ghost` is the default and transparent. `outline` is a raised fill (no
border — the name is kept for API compatibility, not for what it looks
like), for an icon button sitting alone rather than in a toolbar. `accent`
is a soft accent tint, for a toggled or active state — the segmented-tabs
pattern this system does not otherwise reach for.

A square icon-only button is still a `<button>`, but there is no attribute
that tells it apart from a plain [Button](<%= relative_url('/components/button/') %>)
sitting alone — `variant`/`size` mean different things for each — so
`.icon-button` is the one class this component needs. The icon is
`--gl-icon`, one of the [icon tokens](<%= relative_url('/foundations/icons/') %>),
sized to the label type a Button of the same size would carry.

<figure class="example">
<figcaption>Variants</figcaption>
<div>
<button class="icon-button" aria-label="Delete" style="--gl-icon: var(--gl-icon-trash)"></button>
<button class="icon-button" data-variant="outline" aria-label="Settings" style="--gl-icon: var(--gl-icon-settings)"></button>
<button class="icon-button" data-variant="accent" aria-label="Filter (active)" style="--gl-icon: var(--gl-icon-filter)"></button>
</div>
<details open><summary>Markup</summary>
<pre><code>&lt;button class=&quot;icon-button&quot; aria-label=&quot;Delete&quot; style=&quot;--gl-icon: var(--gl-icon-trash)&quot;&gt;&lt;/button&gt;
&lt;button class=&quot;icon-button&quot; data-variant=&quot;outline&quot; aria-label=&quot;Settings&quot; style=&quot;--gl-icon: var(--gl-icon-settings)&quot;&gt;&lt;/button&gt;
&lt;button class=&quot;icon-button&quot; data-variant=&quot;accent&quot; aria-label=&quot;Filter (active)&quot; style=&quot;--gl-icon: var(--gl-icon-filter)&quot;&gt;&lt;/button&gt;</code></pre>
</details>
</figure>

## Sizes

The box is square and fluid, and it is not a number of its own: it is two
rungs of the space scale around one line of the type a
[Button](<%= relative_url('/components/button/') %>) of the same size would
set. So the three sizes come out at 25px, 35–38px, and 39–43px — level with
their Button counterparts at any window width, and still level if the scale
is ever retuned.

<figure class="example">
<figcaption>Sizes</figcaption>
<div>
<button class="icon-button" data-variant="outline" data-size="sm" aria-label="Back" style="--gl-icon: var(--gl-icon-chevron-left)"></button>
<button class="icon-button" data-variant="outline" aria-label="Back" style="--gl-icon: var(--gl-icon-chevron-left)"></button>
<button class="icon-button" data-variant="outline" data-size="lg" aria-label="Back" style="--gl-icon: var(--gl-icon-chevron-left)"></button>
</div>
<details><summary>Markup</summary>
<pre><code>&lt;button class=&quot;icon-button&quot; data-variant=&quot;outline&quot; data-size=&quot;sm&quot; aria-label=&quot;Back&quot; style=&quot;--gl-icon: var(--gl-icon-chevron-left)&quot;&gt;&lt;/button&gt;
&lt;button class=&quot;icon-button&quot; data-variant=&quot;outline&quot; aria-label=&quot;Back&quot; style=&quot;--gl-icon: var(--gl-icon-chevron-left)&quot;&gt;&lt;/button&gt;
&lt;button class=&quot;icon-button&quot; data-variant=&quot;outline&quot; data-size=&quot;lg&quot; aria-label=&quot;Back&quot; style=&quot;--gl-icon: var(--gl-icon-chevron-left)&quot;&gt;&lt;/button&gt;</code></pre>
</details>
</figure>

## Paired with Tooltip

An icon-only control almost always wants a [Tooltip](<%= relative_url('/components/tooltip/') %>) too — the `aria-label` covers accessibility, the tooltip covers a sighted mouse user glancing for a hint.

<figure class="example">
<figcaption>With a tooltip</figcaption>
<div>
<span>
  <button class="icon-button" aria-label="Delete" aria-describedby="icon-btn-tip" style="--gl-icon: var(--gl-icon-trash)"></button>
  <span role="tooltip" id="icon-btn-tip">Delete</span>
</span>
</div>
<details><summary>Markup</summary>
<pre><code>&lt;span&gt;
  &lt;button class=&quot;icon-button&quot; aria-label=&quot;Delete&quot; aria-describedby=&quot;icon-btn-tip&quot; style=&quot;--gl-icon: var(--gl-icon-trash)&quot;&gt;&lt;/button&gt;
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
    <tr><td><code>--gl-icon</code></td><td>an icon token</td><td>Required — the icon. See <a href="<%= relative_url('/foundations/icons/') %>">Icons</a>.</td></tr>
    <tr><td><code>data-size</code></td><td><code>sm | lg</code></td><td>Square, matching the Button of the same size: 25px small, 39–43px large. Omit for the default, 35–38px.</td></tr>
    <tr><td><code>data-variant</code></td><td><code>outline | accent</code></td><td>Omit for the default, transparent ghost look.</td></tr>
  </tbody>
</table>
