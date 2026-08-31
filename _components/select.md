---
title: Select
summary: Native select, styled to match Input exactly.
---

## Basic

`<select>` is the component — styled bare, no class.

<figure class="example">
<figcaption>Select</figcaption>
<div>
<select style="max-width: 20rem;">
  <option>Day</option>
  <option selected="">Week</option>
  <option>Month</option>
  <option>Year</option>
</select>
</div>
<details open><summary>Markup</summary>
<pre><code>&lt;select style=&quot;max-width: 20rem;&quot;&gt;
  &lt;option&gt;Day&lt;/option&gt;
  &lt;option selected=&quot;&quot;&gt;Week&lt;/option&gt;
  &lt;option&gt;Month&lt;/option&gt;
  &lt;option&gt;Year&lt;/option&gt;
&lt;/select&gt;</code></pre>
</details>
</figure>

## Disabled

<figure class="example">
<figcaption>Disabled</figcaption>
<div>
<select disabled="" style="max-width: 20rem;"><option>Week</option></select>
</div>
<details><summary>Markup</summary>
<pre><code>&lt;select disabled=&quot;&quot; style=&quot;max-width: 20rem;&quot;&gt;&lt;option&gt;Week&lt;/option&gt;&lt;/select&gt;</code></pre>
</details>
</figure>

<div class="gl-callout">
  <p>
    The chevron is the one place in this component set that cannot reach a
    <code>var(--gl-*)</code> token — a data-URI <code>background-image</code>
    cannot reference a custom property, so its stroke is a literal hex, kept
    close to <code>--gl-color-text-secondary</code> and commented in the source.
  </p>
</div>

## API

<table>
  <thead><tr><th scope="col">Element / attribute</th><th scope="col">Values</th><th scope="col">Notes</th></tr></thead>
  <tbody>
    <tr><td><code>select</code></td><td></td><td>Required base — no class.</td></tr>
    <tr><td><code>option</code></td><td></td><td></td></tr>
    <tr><td><code>disabled</code></td><td>boolean</td><td></td></tr>
  </tbody>
</table>
