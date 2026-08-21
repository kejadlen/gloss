---
title: Radio
summary: Native radio, the same accent-color treatment as Checkbox.
---

## Basic

<figure class="example">
<figcaption>Radio</figcaption>
<div>
<label>
  <input type="radio" name="demo-radio-1" checked="" />
  Weekly
</label>
<label>
  <input type="radio" name="demo-radio-1" />
  Monthly
</label>
</div>
<details open><summary>Markup</summary>
<pre><code>&lt;label&gt;
  &lt;input type=&quot;radio&quot; name=&quot;demo-radio-1&quot; checked=&quot;&quot; /&gt;
  Weekly
&lt;/label&gt;
&lt;label&gt;
  &lt;input type=&quot;radio&quot; name=&quot;demo-radio-1&quot; /&gt;
  Monthly
&lt;/label&gt;</code></pre>
</details>
</figure>

## As a group

<figure class="example">
<figcaption>Interval</figcaption>
<div>
<fieldset>
  <legend>Repeat</legend>
  <label>
    <input type="radio" name="demo-radio-2" checked="" />
    Every week
  </label>
  <label>
    <input type="radio" name="demo-radio-2" />
    Every month
  </label>
  <label>
    <input type="radio" name="demo-radio-2" />
    Every year
  </label>
</fieldset>
</div>
<details><summary>Markup</summary>
<pre><code>&lt;fieldset&gt;
  &lt;legend&gt;Repeat&lt;/legend&gt;
  &lt;label&gt;
    &lt;input type=&quot;radio&quot; name=&quot;demo-radio-2&quot; checked=&quot;&quot; /&gt;
    Every week
  &lt;/label&gt;
  &lt;label&gt;
    &lt;input type=&quot;radio&quot; name=&quot;demo-radio-2&quot; /&gt;
    Every month
  &lt;/label&gt;
  &lt;label&gt;
    &lt;input type=&quot;radio&quot; name=&quot;demo-radio-2&quot; /&gt;
    Every year
  &lt;/label&gt;
&lt;/fieldset&gt;</code></pre>
</details>
</figure>

## API

<table>
  <thead><tr><th scope="col">Element / attribute</th><th scope="col">Values</th><th scope="col">Notes</th></tr></thead>
  <tbody>
    <tr><td><code>input[type="radio"]</code></td><td></td><td>Required base — no class. Tinted with <code>accent-color</code>.</td></tr>
    <tr><td><code>checked</code></td><td>boolean</td><td></td></tr>
    <tr><td><code>name</code></td><td>string</td><td>Groups mutually exclusive radios.</td></tr>
    <tr><td><code>label</code></td><td>text content</td><td>Wrap the input directly — <code>label:has(&gt; input[type="radio"])</code> is what applies the row layout.</td></tr>
  </tbody>
</table>
