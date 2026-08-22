---
title: Tag
summary: >-
  A removable mono chip for freeform tags — locations, categories. `[data-dashed]`
  renders an "add tag" affordance instead of a value.
---

## Default and removable

Same reasoning as Badge: a `<span>` is too generic to select bare, so Tag
keeps one class. The remove control is a real `<button>`, styled through the
descendant selector `.tag button` — no class of its own.

<figure class="example">
<figcaption>Tags</figcaption>
<div>
<span class="tag">location:garage</span>
<span class="tag">category:appliance</span>
<span class="tag">
  category:receipt
  <button aria-label="Remove tag">×</button>
</span>
</div>
<details open><summary>Markup</summary>
<pre><code>&lt;span class=&quot;tag&quot;&gt;location:garage&lt;/span&gt;
&lt;span class=&quot;tag&quot;&gt;category:appliance&lt;/span&gt;
&lt;span class=&quot;tag&quot;&gt;
  category:receipt
  &lt;button aria-label=&quot;Remove tag&quot;&gt;×&lt;/button&gt;
&lt;/span&gt;</code></pre>
</details>
</figure>

## Dashed — the "add tag" affordance

<figure class="example">
<figcaption>Add tag</figcaption>
<div>
<div class="tag-set">
  <span class="tag">location:garage</span>
  <span class="tag" data-dashed>+ add tag</span>
</div>
</div>
<details><summary>Markup</summary>
<pre><code>&lt;div class=&quot;tag-set&quot;&gt;
  &lt;span class=&quot;tag&quot;&gt;location:garage&lt;/span&gt;
  &lt;span class=&quot;tag&quot; data-dashed&gt;+ add tag&lt;/span&gt;
&lt;/div&gt;</code></pre>
</details>
</figure>

## API

<table>
  <thead><tr><th scope="col">Element / attribute</th><th scope="col">Values</th><th scope="col">Notes</th></tr></thead>
  <tbody>
    <tr><td><code>span.tag</code></td><td></td><td>Required base.</td></tr>
    <tr><td><code>button</code></td><td></td><td>Nest a real <code>&lt;button aria-label="Remove tag"&gt;</code> to render the × affordance — styled via <code>.tag button</code>, no class needed.</td></tr>
    <tr><td><code>data-dashed</code></td><td>boolean</td><td>Renders an "add tag" affordance instead of a value.</td></tr>
  </tbody>
</table>
