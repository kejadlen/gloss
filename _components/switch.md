---
title: Switch
summary: >-
  Toggle switch for on/off settings. The one moving part in this system —
  everything else transitions color or border, never position.
---

## Basic

<figure class="example">
<figcaption>Switch</figcaption>
<div>
<label class="ad-switch">
  <input type="checkbox" checked="" />
  <span class="ad-switch__track"></span>
  Dark mode
</label>
<label class="ad-switch">
  <input type="checkbox" />
  <span class="ad-switch__track"></span>
  Weekly digest
</label>
</div>
<details open><summary>Markup</summary>
<pre><code>&lt;label class=&quot;ad-switch&quot;&gt;
  &lt;input type=&quot;checkbox&quot; checked=&quot;&quot; /&gt;
  &lt;span class=&quot;ad-switch__track&quot;&gt;&lt;/span&gt;
  Dark mode
&lt;/label&gt;
&lt;label class=&quot;ad-switch&quot;&gt;
  &lt;input type=&quot;checkbox&quot; /&gt;
  &lt;span class=&quot;ad-switch__track&quot;&gt;&lt;/span&gt;
  Weekly digest
&lt;/label&gt;</code></pre>
</details>
</figure>

## Disabled

<figure class="example">
<figcaption>Disabled</figcaption>
<div>
<label class="ad-switch">
  <input type="checkbox" checked="" disabled="" />
  <span class="ad-switch__track"></span>
  Always on for this plan
</label>
</div>
<details><summary>Markup</summary>
<pre><code>&lt;label class=&quot;ad-switch&quot;&gt;
  &lt;input type=&quot;checkbox&quot; checked=&quot;&quot; disabled=&quot;&quot; /&gt;
  &lt;span class=&quot;ad-switch__track&quot;&gt;&lt;/span&gt;
  Always on for this plan
&lt;/label&gt;</code></pre>
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
