---
title: Input
summary: >-
  A bordered text input, styled to match Select exactly. Usually wrapped in
  Field for its label and hint.
---

## Basic

<figure class="example">
<figcaption>Input</figcaption>
<div>
<input class="ad-input" type="text" placeholder="Dishwasher manual" style="max-width: 20rem;" />
</div>
<details open><summary>Markup</summary>
<pre><code>&lt;input class=&quot;ad-input&quot; type=&quot;text&quot; placeholder=&quot;Dishwasher manual&quot; style=&quot;max-width: 20rem;&quot; /&gt;</code></pre>
</details>
</figure>

## Focus and disabled

<figure class="example">
<figcaption>States</figcaption>
<div data-layout="stack">
<input class="ad-input" type="text" value="Focused" style="max-width: 20rem; border-color: var(--ad-color-accent); box-shadow: 0 0 0 2px var(--ad-color-accent-soft);" />
<input class="ad-input" type="text" value="Disabled" disabled="" style="max-width: 20rem;" />
</div>
<details><summary>Markup</summary>
<pre><code>&lt;input class=&quot;ad-input&quot; type=&quot;text&quot; value=&quot;Focused&quot; style=&quot;max-width: 20rem; border-color: var(--ad-color-accent); box-shadow: 0 0 0 2px var(--ad-color-accent-soft);&quot; /&gt;
&lt;input class=&quot;ad-input&quot; type=&quot;text&quot; value=&quot;Disabled&quot; disabled=&quot;&quot; style=&quot;max-width: 20rem;&quot; /&gt;</code></pre>
</details>
</figure>

## Invalid

Invalid state is expressed on the control itself, so it works with native
form validation, plus an error line below.

<figure class="example">
<figcaption>Invalid</figcaption>
<div>
<div class="ad-field" style="max-width: 20rem;">
  <label class="ad-field__label" for="input-accent">Accent hex</label>
  <input class="ad-input" id="input-accent" type="text" value="not-a-color" aria-invalid="true" aria-describedby="input-accent-error" />
  <p class="ad-field__error" id="input-accent-error">Not a valid hex color.</p>
</div>
</div>
<details><summary>Markup</summary>
<pre><code>&lt;div class=&quot;ad-field&quot; style=&quot;max-width: 20rem;&quot;&gt;
  &lt;label class=&quot;ad-field__label&quot; for=&quot;input-accent&quot;&gt;Accent hex&lt;/label&gt;
  &lt;input class=&quot;ad-input&quot; id=&quot;input-accent&quot; type=&quot;text&quot; value=&quot;not-a-color&quot; aria-invalid=&quot;true&quot; aria-describedby=&quot;input-accent-error&quot; /&gt;
  &lt;p class=&quot;ad-field__error&quot; id=&quot;input-accent-error&quot;&gt;Not a valid hex color.&lt;/p&gt;
&lt;/div&gt;</code></pre>
</details>
</figure>

## API

<div class="ad-table-wrap">
  <table class="ad-table ad-table--compact">
    <thead><tr><th scope="col">Prop</th><th scope="col">Type</th><th scope="col">Notes</th></tr></thead>
    <tbody>
      <tr><td class="ad-token-name">type</td><td class="ad-table__code">string</td><td>Any native input type.</td></tr>
      <tr><td class="ad-token-name">placeholder</td><td class="ad-table__code">string</td><td></td></tr>
      <tr><td class="ad-token-name">disabled</td><td class="ad-table__code">boolean</td><td></td></tr>
      <tr><td class="ad-token-name">aria-invalid</td><td class="ad-table__code">"true"</td><td>Reddens the border and fill.</td></tr>
    </tbody>
  </table>
</div>
