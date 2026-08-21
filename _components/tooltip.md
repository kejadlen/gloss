---
title: Tooltip
summary: >-
  Dark mono tooltip on hover, positioned above the child. Pure CSS — shown on
  hover and keyboard focus, no JavaScript required.
---

## Basic

Hover or tab to the button below.

<figure class="example">
<figcaption>Tooltip</figcaption>
<div>
<span class="ad-tooltip">
  <button type="button" class="ad-icon-btn" aria-label="Delete">
    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M4 7h16M9 7V4h6v3M6 7l1 13h10l1-13" /></svg>
  </button>
  <span class="ad-tooltip__bubble">Delete</span>
</span>
</div>
<details open><summary>Markup</summary>
<pre><code>&lt;span class=&quot;ad-tooltip&quot;&gt;
  &lt;button type=&quot;button&quot; class=&quot;ad-icon-btn&quot; aria-label=&quot;Delete&quot;&gt;
    &lt;svg width=&quot;16&quot; height=&quot;16&quot; viewBox=&quot;0 0 24 24&quot; fill=&quot;none&quot; stroke=&quot;currentColor&quot; stroke-width=&quot;1.75&quot; stroke-linecap=&quot;round&quot; stroke-linejoin=&quot;round&quot; aria-hidden=&quot;true&quot;&gt;&lt;path d=&quot;M4 7h16M9 7V4h6v3M6 7l1 13h10l1-13&quot; /&gt;&lt;/svg&gt;
  &lt;/button&gt;
  &lt;span class=&quot;ad-tooltip__bubble&quot;&gt;Delete&lt;/span&gt;
&lt;/span&gt;</code></pre>
</details>
</figure>

## On any element

A Tooltip wraps whatever it labels — most often an [IconButton](<%= relative_url('/components/icon-button/') %>), since that is the control with no visible text of its own.

<figure class="example">
<figcaption>On a badge</figcaption>
<div>
<span class="ad-tooltip">
  <span class="ad-badge ad-badge--danger" tabindex="0">3d overdue</span>
  <span class="ad-tooltip__bubble">Due Tuesday, was Saturday</span>
</span>
</div>
<details><summary>Markup</summary>
<pre><code>&lt;span class=&quot;ad-tooltip&quot;&gt;
  &lt;span class=&quot;ad-badge ad-badge--danger&quot; tabindex=&quot;0&quot;&gt;3d overdue&lt;/span&gt;
  &lt;span class=&quot;ad-tooltip__bubble&quot;&gt;Due Tuesday, was Saturday&lt;/span&gt;
&lt;/span&gt;</code></pre>
</details>
</figure>

## API

<div class="ad-table-wrap">
  <table class="ad-table ad-table--compact">
    <thead><tr><th scope="col">Prop</th><th scope="col">Type</th><th scope="col">Notes</th></tr></thead>
    <tbody>
      <tr><td class="ad-token-name">label</td><td class="ad-table__code">string</td><td>Required.</td></tr>
      <tr><td class="ad-token-name">children</td><td class="ad-table__code">node</td><td>The trigger element. Give it a real accessible name of its own — a tooltip is not one.</td></tr>
    </tbody>
  </table>
</div>
