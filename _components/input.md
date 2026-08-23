---
title: Input
summary: >-
  A bordered text input, styled to match Select exactly. Usually wrapped in
  Field for its label and hint.
---

## Basic

`<input>` is the component — styled bare, no class. Nothing else on this
site uses a text input, so there is nothing for the selector to clash with.

<figure class="example">
<figcaption>Input</figcaption>
<div>
<input type="text" placeholder="Dishwasher manual" style="max-width: 20rem;" />
</div>
<details open><summary>Markup</summary>
<pre><code>&lt;input type=&quot;text&quot; placeholder=&quot;Dishwasher manual&quot; style=&quot;max-width: 20rem;&quot; /&gt;</code></pre>
</details>
</figure>

## Focus and disabled

<figure class="example">
<figcaption>States</figcaption>
<div data-layout="stack">
<input type="text" value="Focused" autofocus style="max-width: 20rem;" />
<input type="text" value="Disabled" disabled="" style="max-width: 20rem;" />
</div>
<details><summary>Markup</summary>
<pre><code>&lt;input type=&quot;text&quot; value=&quot;Focused&quot; autofocus style=&quot;max-width: 20rem;&quot; /&gt;
&lt;input type=&quot;text&quot; value=&quot;Disabled&quot; disabled=&quot;&quot; style=&quot;max-width: 20rem;&quot; /&gt;</code></pre>
</details>
</figure>

## Invalid

Invalid state is expressed on the control itself, so it works with native
form validation, plus an error line below. `role="alert"` is a real
live-region role for validation text, so it doubles as the selector that
turns a `<small>` hint red.

<figure class="example">
<figcaption>Invalid</figcaption>
<div>
<label class="field" style="max-width: 20rem;">
  Accent hex
  <input type="text" value="not-a-color" aria-invalid="true" />
  <small role="alert">Not a valid hex color.</small>
</label>
</div>
<details><summary>Markup</summary>
<pre><code>&lt;label class=&quot;field&quot; style=&quot;max-width: 20rem;&quot;&gt;
  Accent hex
  &lt;input type=&quot;text&quot; value=&quot;not-a-color&quot; aria-invalid=&quot;true&quot; /&gt;
  &lt;small role=&quot;alert&quot;&gt;Not a valid hex color.&lt;/small&gt;
&lt;/label&gt;</code></pre>
</details>
</figure>

## API

<table>
  <thead><tr><th scope="col">Element / attribute</th><th scope="col">Values</th><th scope="col">Notes</th></tr></thead>
  <tbody>
    <tr><td><code>input</code></td><td></td><td>Required base — no class.</td></tr>
    <tr><td><code>type</code></td><td>string</td><td>Any native input type except <code>checkbox</code>/<code>radio</code>, which are their own components.</td></tr>
    <tr><td><code>placeholder</code></td><td>string</td><td></td></tr>
    <tr><td><code>disabled</code></td><td>boolean</td><td></td></tr>
    <tr><td><code>aria-invalid</code></td><td><code>"true"</code></td><td>Reddens the border and fill.</td></tr>
  </tbody>
</table>
