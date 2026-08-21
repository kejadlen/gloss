---
title: Radio
summary: Flat radio button, the same visual language as Checkbox.
---

## Basic

<figure class="example">
<figcaption>Radio</figcaption>
<div>
<label class="ad-choice ad-choice--radio">
  <input type="radio" name="demo-radio-1" checked="" />
  <span class="ad-choice__box"></span>
  Weekly
</label>
<label class="ad-choice ad-choice--radio">
  <input type="radio" name="demo-radio-1" />
  <span class="ad-choice__box"></span>
  Monthly
</label>
</div>
<details open><summary>Markup</summary>
<pre><code>&lt;label class=&quot;ad-choice ad-choice--radio&quot;&gt;
  &lt;input type=&quot;radio&quot; name=&quot;demo-radio-1&quot; checked=&quot;&quot; /&gt;
  &lt;span class=&quot;ad-choice__box&quot;&gt;&lt;/span&gt;
  Weekly
&lt;/label&gt;
&lt;label class=&quot;ad-choice ad-choice--radio&quot;&gt;
  &lt;input type=&quot;radio&quot; name=&quot;demo-radio-1&quot; /&gt;
  &lt;span class=&quot;ad-choice__box&quot;&gt;&lt;/span&gt;
  Monthly
&lt;/label&gt;</code></pre>
</details>
</figure>

## As a group

<figure class="example">
<figcaption>Interval</figcaption>
<div>
<fieldset class="ad-fieldset">
  <legend>Repeat</legend>
  <label class="ad-choice ad-choice--radio">
    <input type="radio" name="demo-radio-2" checked="" />
    <span class="ad-choice__box"></span>
    Every week
  </label>
  <label class="ad-choice ad-choice--radio">
    <input type="radio" name="demo-radio-2" />
    <span class="ad-choice__box"></span>
    Every month
  </label>
  <label class="ad-choice ad-choice--radio">
    <input type="radio" name="demo-radio-2" />
    <span class="ad-choice__box"></span>
    Every year
  </label>
</fieldset>
</div>
<details><summary>Markup</summary>
<pre><code>&lt;fieldset class=&quot;ad-fieldset&quot;&gt;
  &lt;legend&gt;Repeat&lt;/legend&gt;
  &lt;label class=&quot;ad-choice ad-choice--radio&quot;&gt;
    &lt;input type=&quot;radio&quot; name=&quot;demo-radio-2&quot; checked=&quot;&quot; /&gt;
    &lt;span class=&quot;ad-choice__box&quot;&gt;&lt;/span&gt;
    Every week
  &lt;/label&gt;
  &lt;label class=&quot;ad-choice ad-choice--radio&quot;&gt;
    &lt;input type=&quot;radio&quot; name=&quot;demo-radio-2&quot; /&gt;
    &lt;span class=&quot;ad-choice__box&quot;&gt;&lt;/span&gt;
    Every month
  &lt;/label&gt;
  &lt;label class=&quot;ad-choice ad-choice--radio&quot;&gt;
    &lt;input type=&quot;radio&quot; name=&quot;demo-radio-2&quot; /&gt;
    &lt;span class=&quot;ad-choice__box&quot;&gt;&lt;/span&gt;
    Every year
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
      <tr><td class="ad-token-name">name</td><td class="ad-table__code">string</td><td>Groups mutually exclusive radios.</td></tr>
      <tr><td class="ad-token-name">label</td><td class="ad-table__code">node</td><td></td></tr>
    </tbody>
  </table>
</div>
