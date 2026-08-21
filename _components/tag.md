---
title: Tag
summary: >-
  A removable mono chip for freeform tags — locations, categories. `--dashed`
  renders an "add tag" affordance instead of a value.
---

## Default and removable

<figure class="example">
<figcaption>Tags</figcaption>
<div>
<span class="ad-tag">location:garage</span>
<span class="ad-tag">category:appliance</span>
<span class="ad-tag">
  category:receipt
  <button type="button" class="ad-tag__remove" aria-label="Remove tag">×</button>
</span>
</div>
<details open><summary>Markup</summary>
<pre><code>&lt;span class=&quot;ad-tag&quot;&gt;location:garage&lt;/span&gt;
&lt;span class=&quot;ad-tag&quot;&gt;category:appliance&lt;/span&gt;
&lt;span class=&quot;ad-tag&quot;&gt;
  category:receipt
  &lt;button type=&quot;button&quot; class=&quot;ad-tag__remove&quot; aria-label=&quot;Remove tag&quot;&gt;×&lt;/button&gt;
&lt;/span&gt;</code></pre>
</details>
</figure>

## Dashed — the "add tag" affordance

<figure class="example">
<figcaption>Add tag</figcaption>
<div>
<div class="ad-tag-set">
  <span class="ad-tag">location:garage</span>
  <span class="ad-tag ad-tag--dashed">+ add tag</span>
</div>
</div>
<details><summary>Markup</summary>
<pre><code>&lt;div class=&quot;ad-tag-set&quot;&gt;
  &lt;span class=&quot;ad-tag&quot;&gt;location:garage&lt;/span&gt;
  &lt;span class=&quot;ad-tag ad-tag--dashed&quot;&gt;+ add tag&lt;/span&gt;
&lt;/div&gt;</code></pre>
</details>
</figure>

## API

<div class="ad-table-wrap">
  <table class="ad-table ad-table--compact">
    <thead><tr><th scope="col">Prop</th><th scope="col">Type</th><th scope="col">Notes</th></tr></thead>
    <tbody>
      <tr><td class="ad-token-name">onRemove</td><td class="ad-table__code">function</td><td>Renders the × button when present.</td></tr>
      <tr><td class="ad-token-name">dashed</td><td class="ad-table__code">boolean</td><td>Renders an "add tag" affordance instead of a value.</td></tr>
    </tbody>
  </table>
</div>
