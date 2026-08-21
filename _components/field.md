---
title: Field
summary: >-
  The labeled field wrapper. Mono, uppercase, tracked label — the same
  catalog-label convention as Badge and type-label — with an optional hint.
---

## Basic

<figure class="example">
<figcaption>Field</figcaption>
<div>
<div class="ad-field" style="max-width: 20rem;">
  <label class="ad-field__label" for="field-name">Name</label>
  <input class="ad-input" id="field-name" type="text" placeholder="Call Mom" />
  <span class="ad-field__hint">First line becomes the display name.</span>
</div>
</div>
<details open><summary>Markup</summary>
<pre><code>&lt;div class=&quot;ad-field&quot; style=&quot;max-width: 20rem;&quot;&gt;
  &lt;label class=&quot;ad-field__label&quot; for=&quot;field-name&quot;&gt;Name&lt;/label&gt;
  &lt;input class=&quot;ad-input&quot; id=&quot;field-name&quot; type=&quot;text&quot; placeholder=&quot;Call Mom&quot; /&gt;
  &lt;span class=&quot;ad-field__hint&quot;&gt;First line becomes the display name.&lt;/span&gt;
&lt;/div&gt;</code></pre>
</details>
</figure>

## Holding any control

Field wraps [Input](<%= relative_url('/components/input/') %>),
[Select](<%= relative_url('/components/select/') %>), or anything else — it
only owns the label and the hint line, never the control's own styling.

<figure class="example">
<figcaption>Field with a select</figcaption>
<div>
<div class="ad-field" style="max-width: 20rem;">
  <label class="ad-field__label" for="field-unit">Unit</label>
  <select class="ad-select" id="field-unit">
    <option>Day</option>
    <option selected="">Week</option>
    <option>Month</option>
    <option>Year</option>
  </select>
</div>
</div>
<details><summary>Markup</summary>
<pre><code>&lt;div class=&quot;ad-field&quot; style=&quot;max-width: 20rem;&quot;&gt;
  &lt;label class=&quot;ad-field__label&quot; for=&quot;field-unit&quot;&gt;Unit&lt;/label&gt;
  &lt;select class=&quot;ad-select&quot; id=&quot;field-unit&quot;&gt;
    &lt;option&gt;Day&lt;/option&gt;
    &lt;option selected=&quot;&quot;&gt;Week&lt;/option&gt;
    &lt;option&gt;Month&lt;/option&gt;
    &lt;option&gt;Year&lt;/option&gt;
  &lt;/select&gt;
&lt;/div&gt;</code></pre>
</details>
</figure>

## In a row

<figure class="example">
<figcaption>Two fields in a row</figcaption>
<div>
<div class="ad-form" style="max-width: none;">
  <div class="ad-form__row">
    <div class="ad-field">
      <label class="ad-field__label" for="field-every">Every</label>
      <input class="ad-input" id="field-every" type="number" placeholder="2" />
    </div>
    <div class="ad-field">
      <label class="ad-field__label" for="field-unit-2">Unit</label>
      <select class="ad-select" id="field-unit-2">
        <option>Day</option><option selected="">Week</option><option>Month</option>
      </select>
    </div>
  </div>
</div>
</div>
<details><summary>Markup</summary>
<pre><code>&lt;div class=&quot;ad-form&quot; style=&quot;max-width: none;&quot;&gt;
  &lt;div class=&quot;ad-form__row&quot;&gt;
    &lt;div class=&quot;ad-field&quot;&gt;
      &lt;label class=&quot;ad-field__label&quot; for=&quot;field-every&quot;&gt;Every&lt;/label&gt;
      &lt;input class=&quot;ad-input&quot; id=&quot;field-every&quot; type=&quot;number&quot; placeholder=&quot;2&quot; /&gt;
    &lt;/div&gt;
    &lt;div class=&quot;ad-field&quot;&gt;
      &lt;label class=&quot;ad-field__label&quot; for=&quot;field-unit-2&quot;&gt;Unit&lt;/label&gt;
      &lt;select class=&quot;ad-select&quot; id=&quot;field-unit-2&quot;&gt;
        &lt;option&gt;Day&lt;/option&gt;&lt;option selected=&quot;&quot;&gt;Week&lt;/option&gt;&lt;option&gt;Month&lt;/option&gt;
      &lt;/select&gt;
    &lt;/div&gt;
  &lt;/div&gt;
&lt;/div&gt;</code></pre>
</details>
</figure>

## API

<div class="ad-table-wrap">
  <table class="ad-table ad-table--compact">
    <thead><tr><th scope="col">Prop</th><th scope="col">Type</th><th scope="col">Notes</th></tr></thead>
    <tbody>
      <tr><td class="ad-token-name">label</td><td class="ad-table__code">string</td><td>Mono, uppercase, tracked.</td></tr>
      <tr><td class="ad-token-name">hint</td><td class="ad-table__code">string</td><td>Renders below the control.</td></tr>
    </tbody>
  </table>
</div>
