---
title: Tooltip
summary: >-
  Dark mono tooltip on hover, positioned above the child. Pure CSS — shown on
  hover and keyboard focus, no JavaScript required.
---

## Basic

`role="tooltip"` is the correct ARIA role for the bubble itself, so it
doubles as the styling hook — no class on the bubble. The wrapping `<span>`
has no attribute of its own, but it does not need one: `:has()` selects "a
span that contains a `[role=tooltip]` bubble" precisely, so the wrapper stays
bare too. Pair the trigger's `aria-describedby` with the bubble's `id` so the
tooltip is announced, not just shown.

Hover or tab to the button below.

<figure class="example">
<figcaption>Tooltip</figcaption>
<div>
<span>
  <button class="icon-button" aria-label="Delete" aria-describedby="tooltip-basic">
    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M4 7h16M9 7V4h6v3M6 7l1 13h10l1-13" /></svg>
  </button>
  <span role="tooltip" id="tooltip-basic">Delete</span>
</span>
</div>
<details open><summary>Markup</summary>
<pre><code>&lt;span&gt;
  &lt;button type=&quot;button&quot; class=&quot;icon-button&quot; aria-label=&quot;Delete&quot; aria-describedby=&quot;tooltip-basic&quot;&gt;
    &lt;svg width=&quot;16&quot; height=&quot;16&quot; viewBox=&quot;0 0 24 24&quot; fill=&quot;none&quot; stroke=&quot;currentColor&quot; stroke-width=&quot;1.75&quot; stroke-linecap=&quot;round&quot; stroke-linejoin=&quot;round&quot; aria-hidden=&quot;true&quot;&gt;&lt;path d=&quot;M4 7h16M9 7V4h6v3M6 7l1 13h10l1-13&quot; /&gt;&lt;/svg&gt;
  &lt;/button&gt;
  &lt;span role=&quot;tooltip&quot; id=&quot;tooltip-basic&quot;&gt;Delete&lt;/span&gt;
&lt;/span&gt;</code></pre>
</details>
</figure>

## On any element

A Tooltip wraps whatever it labels — most often an [IconButton](<%= relative_url('/components/icon-button/') %>), since that is the control with no visible text of its own.

<figure class="example">
<figcaption>On a badge</figcaption>
<div>
<span>
  <span class="badge" data-tone="danger" tabindex="0" aria-describedby="tooltip-badge">3d overdue</span>
  <span role="tooltip" id="tooltip-badge">Due Tuesday, was Saturday</span>
</span>
</div>
<details><summary>Markup</summary>
<pre><code>&lt;span&gt;
  &lt;span class=&quot;badge&quot; data-tone=&quot;danger&quot; tabindex=&quot;0&quot; aria-describedby=&quot;tooltip-badge&quot;&gt;3d overdue&lt;/span&gt;
  &lt;span role=&quot;tooltip&quot; id=&quot;tooltip-badge&quot;&gt;Due Tuesday, was Saturday&lt;/span&gt;
&lt;/span&gt;</code></pre>
</details>
</figure>

## API

<table>
  <thead><tr><th scope="col">Element / attribute</th><th scope="col">Values</th><th scope="col">Notes</th></tr></thead>
  <tbody>
    <tr><td><code>span</code></td><td></td><td>Required wrapper around the trigger and the bubble. Bare — matched structurally via <code>:has()</code>, no class.</td></tr>
    <tr><td><code>[role="tooltip"]</code></td><td>string content</td><td>Required — the bubble. Give it an <code>id</code>.</td></tr>
    <tr><td><code>aria-describedby</code></td><td>the bubble's <code>id</code></td><td>Put it on the trigger element, which needs a real accessible name of its own — a tooltip is not one.</td></tr>
  </tbody>
</table>
