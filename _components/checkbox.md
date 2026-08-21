---
title: Checkbox
summary: Flat checkbox, fills with the accent when checked. No bounce.
---

## Basic

<figure class="example">
<figcaption>Checkbox</figcaption>
<div>
<label class="ad-choice ad-choice--checkbox">
  <input type="checkbox" />
  <span class="ad-choice__box"></span>
  Notify me
</label>
<label class="ad-choice ad-choice--checkbox">
  <input type="checkbox" checked="" />
  <span class="ad-choice__box">
    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M20 6 9 17l-5-5" /></svg>
  </span>
  Ship on merge
</label>
</div>
<details open><summary>Markup</summary>
<pre><code>&lt;label class=&quot;ad-choice ad-choice--checkbox&quot;&gt;
  &lt;input type=&quot;checkbox&quot; /&gt;
  &lt;span class=&quot;ad-choice__box&quot;&gt;&lt;/span&gt;
  Notify me
&lt;/label&gt;
&lt;label class=&quot;ad-choice ad-choice--checkbox&quot;&gt;
  &lt;input type=&quot;checkbox&quot; checked=&quot;&quot; /&gt;
  &lt;span class=&quot;ad-choice__box&quot;&gt;
    &lt;svg viewBox=&quot;0 0 24 24&quot; fill=&quot;none&quot; stroke=&quot;currentColor&quot; stroke-width=&quot;3&quot; stroke-linecap=&quot;round&quot; stroke-linejoin=&quot;round&quot; aria-hidden=&quot;true&quot;&gt;&lt;path d=&quot;M20 6 9 17l-5-5&quot; /&gt;&lt;/svg&gt;
  &lt;/span&gt;
  Ship on merge
&lt;/label&gt;</code></pre>
</details>
</figure>

## Disabled

<figure class="example">
<figcaption>Disabled</figcaption>
<div>
<label class="ad-choice ad-choice--checkbox" aria-disabled="true">
  <input type="checkbox" disabled="" />
  <span class="ad-choice__box"></span>
  Not available on this plan
</label>
</div>
<details><summary>Markup</summary>
<pre><code>&lt;label class=&quot;ad-choice ad-choice--checkbox&quot; aria-disabled=&quot;true&quot;&gt;
  &lt;input type=&quot;checkbox&quot; disabled=&quot;&quot; /&gt;
  &lt;span class=&quot;ad-choice__box&quot;&gt;&lt;/span&gt;
  Not available on this plan
&lt;/label&gt;</code></pre>
</details>
</figure>

## In a fieldset

<figure class="example">
<figcaption>Fieldset</figcaption>
<div>
<fieldset class="ad-fieldset">
  <legend>Notify me about</legend>
  <label class="ad-choice ad-choice--checkbox">
    <input type="checkbox" checked="" />
    <span class="ad-choice__box"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M20 6 9 17l-5-5" /></svg></span>
    Overdue tasks
  </label>
  <label class="ad-choice ad-choice--checkbox">
    <input type="checkbox" />
    <span class="ad-choice__box"></span>
    Weekly digest
  </label>
</fieldset>
</div>
<details><summary>Markup</summary>
<pre><code>&lt;fieldset class=&quot;ad-fieldset&quot;&gt;
  &lt;legend&gt;Notify me about&lt;/legend&gt;
  &lt;label class=&quot;ad-choice ad-choice--checkbox&quot;&gt;
    &lt;input type=&quot;checkbox&quot; checked=&quot;&quot; /&gt;
    &lt;span class=&quot;ad-choice__box&quot;&gt;&lt;svg viewBox=&quot;0 0 24 24&quot; fill=&quot;none&quot; stroke=&quot;currentColor&quot; stroke-width=&quot;3&quot; stroke-linecap=&quot;round&quot; stroke-linejoin=&quot;round&quot; aria-hidden=&quot;true&quot;&gt;&lt;path d=&quot;M20 6 9 17l-5-5&quot; /&gt;&lt;/svg&gt;&lt;/span&gt;
    Overdue tasks
  &lt;/label&gt;
  &lt;label class=&quot;ad-choice ad-choice--checkbox&quot;&gt;
    &lt;input type=&quot;checkbox&quot; /&gt;
    &lt;span class=&quot;ad-choice__box&quot;&gt;&lt;/span&gt;
    Weekly digest
  &lt;/label&gt;
&lt;/fieldset&gt;</code></pre>
</details>
</figure>

## API

<div class="ad-table-wrap">
  <table class="ad-table ad-table--compact">
    <thead><tr><th scope="col">Prop</th><th scope="col">Type</th><th scope="col">Notes</th></tr></thead>
    <tbody>
      <tr><td class="ad-token-name">checked</td><td class="ad-table__code">boolean</td><td>Required.</td></tr>
      <tr><td class="ad-token-name">label</td><td class="ad-table__code">node</td><td></td></tr>
      <tr><td class="ad-token-name">disabled</td><td class="ad-table__code">boolean</td><td></td></tr>
    </tbody>
  </table>
</div>
