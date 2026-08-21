---
title: Field
summary: >-
  The labeled field wrapper. Mono, uppercase, tracked label — the same
  catalog-label convention as Badge and type-label — with an optional hint.
---

## Basic

Field is a `<label>` that wraps its caption text together with the control —
association is native, no `for`/`id` pair to keep in sync. A `<label>` plays
three different roles in this system (this wrapper, Checkbox/Radio's row,
Switch's row), so it cannot be styled bare without one leaking into another;
`.field` is the one of the three with no distinguishing attribute, so it is
the one that keeps a class. Hint text is a native `<small>`.

<figure class="example">
<figcaption>Field</figcaption>
<div>
<label class="field" style="max-width: 20rem;">
  Name
  <input type="text" placeholder="Call Mom" />
  <small>First line becomes the display name.</small>
</label>
</div>
<details open><summary>Markup</summary>
<pre><code>&lt;label class=&quot;field&quot; style=&quot;max-width: 20rem;&quot;&gt;
  Name
  &lt;input type=&quot;text&quot; placeholder=&quot;Call Mom&quot; /&gt;
  &lt;small&gt;First line becomes the display name.&lt;/small&gt;
&lt;/label&gt;</code></pre>
</details>
</figure>

## Holding any control

Field wraps [Input](<%= relative_url('/components/input/') %>),
[Select](<%= relative_url('/components/select/') %>), or anything else — it
only owns the caption and the hint line, never the control's own styling.

<figure class="example">
<figcaption>Field with a select</figcaption>
<div>
<label class="field" style="max-width: 20rem;">
  Unit
  <select>
    <option>Day</option>
    <option selected="">Week</option>
    <option>Month</option>
    <option>Year</option>
  </select>
</label>
</div>
<details><summary>Markup</summary>
<pre><code>&lt;label class=&quot;field&quot; style=&quot;max-width: 20rem;&quot;&gt;
  Unit
  &lt;select&gt;
    &lt;option&gt;Day&lt;/option&gt;
    &lt;option selected=&quot;&quot;&gt;Week&lt;/option&gt;
    &lt;option&gt;Month&lt;/option&gt;
    &lt;option&gt;Year&lt;/option&gt;
  &lt;/select&gt;
&lt;/label&gt;</code></pre>
</details>
</figure>

## In a row

`.form-row` is a sanctioned class for the one shape here with no element of
its own — a row grouping two fields side by side.

<figure class="example">
<figcaption>Two fields in a row</figcaption>
<div>
<form style="max-width: none;">
  <div class="form-row">
    <label class="field">
      Every
      <input type="number" placeholder="2" />
    </label>
    <label class="field">
      Unit
      <select>
        <option>Day</option><option selected="">Week</option><option>Month</option>
      </select>
    </label>
  </div>
</form>
</div>
<details><summary>Markup</summary>
<pre><code>&lt;form style=&quot;max-width: none;&quot;&gt;
  &lt;div class=&quot;form-row&quot;&gt;
    &lt;label class=&quot;field&quot;&gt;
      Every
      &lt;input type=&quot;number&quot; placeholder=&quot;2&quot; /&gt;
    &lt;/label&gt;
    &lt;label class=&quot;field&quot;&gt;
      Unit
      &lt;select&gt;
        &lt;option&gt;Day&lt;/option&gt;&lt;option selected=&quot;&quot;&gt;Week&lt;/option&gt;&lt;option&gt;Month&lt;/option&gt;
      &lt;/select&gt;
    &lt;/label&gt;
  &lt;/div&gt;
&lt;/form&gt;</code></pre>
</details>
</figure>

## API

<table>
  <thead><tr><th scope="col">Element / attribute</th><th scope="col">Values</th><th scope="col">Notes</th></tr></thead>
  <tbody>
    <tr><td><code>label.field</code></td><td></td><td>Required base. Wraps the caption text and the control together.</td></tr>
    <tr><td><code>&gt; small</code></td><td>string</td><td>The hint. Renders below the control.</td></tr>
    <tr><td><code>&gt; small[role="alert"]</code></td><td>string</td><td>An error instead of a hint — see <a href="<%= relative_url('/components/input/') %>">Input</a>.</td></tr>
  </tbody>
</table>
