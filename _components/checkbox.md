---
title: Checkbox
summary: Native checkbox, tinted with the accent color. No hand-drawn box.
---

## Basic

`input[type="checkbox"]` is the component — styled bare with `accent-color`
rather than a custom box, so the browser draws its own check. This is a real
reduction, not just a rename: it deletes the hand-drawn SVG-checkmark markup
that a `.ad-choice__box` span used to need. The wrapping `<label>` is told
apart from Field's label structurally — it `:has()` a checkbox as a direct
child — so it needs no class either.

<figure class="example">
<figcaption>Checkbox</figcaption>
<div>
<label>
  <input type="checkbox" />
  Notify me
</label>
<label>
  <input type="checkbox" checked="" />
  Ship on merge
</label>
</div>
<details open><summary>Markup</summary>
<pre><code>&lt;label&gt;
  &lt;input type=&quot;checkbox&quot; /&gt;
  Notify me
&lt;/label&gt;
&lt;label&gt;
  &lt;input type=&quot;checkbox&quot; checked=&quot;&quot; /&gt;
  Ship on merge
&lt;/label&gt;</code></pre>
</details>
</figure>

## Disabled

<figure class="example">
<figcaption>Disabled</figcaption>
<div>
<label>
  <input type="checkbox" disabled="" />
  Not available on this plan
</label>
</div>
<details><summary>Markup</summary>
<pre><code>&lt;label&gt;
  &lt;input type=&quot;checkbox&quot; disabled=&quot;&quot; /&gt;
  Not available on this plan
&lt;/label&gt;</code></pre>
</details>
</figure>

## In a fieldset

`<fieldset>`/`<legend>` are styled bare too — they already mean this.

<figure class="example">
<figcaption>Fieldset</figcaption>
<div>
<fieldset>
  <legend>Notify me about</legend>
  <label>
    <input type="checkbox" checked="" />
    Overdue tasks
  </label>
  <label>
    <input type="checkbox" />
    Weekly digest
  </label>
</fieldset>
</div>
<details><summary>Markup</summary>
<pre><code>&lt;fieldset&gt;
  &lt;legend&gt;Notify me about&lt;/legend&gt;
  &lt;label&gt;
    &lt;input type=&quot;checkbox&quot; checked=&quot;&quot; /&gt;
    Overdue tasks
  &lt;/label&gt;
  &lt;label&gt;
    &lt;input type=&quot;checkbox&quot; /&gt;
    Weekly digest
  &lt;/label&gt;
&lt;/fieldset&gt;</code></pre>
</details>
</figure>

## API

<table>
  <thead><tr><th scope="col">Element / attribute</th><th scope="col">Values</th><th scope="col">Notes</th></tr></thead>
  <tbody>
    <tr><td><code>input[type="checkbox"]</code></td><td></td><td>Required base — no class. Tinted with <code>accent-color</code>.</td></tr>
    <tr><td><code>checked</code></td><td>boolean</td><td></td></tr>
    <tr><td><code>disabled</code></td><td>boolean</td><td></td></tr>
    <tr><td><code>label</code></td><td>text content</td><td>Wrap the input directly — <code>label:has(&gt; input[type="checkbox"])</code> is what applies the row layout.</td></tr>
  </tbody>
</table>
