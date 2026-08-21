---
title: Badge
summary: >-
  Mono, uppercase, tracked — the catalog-label convention for status and meta
  values. An archivist's tag, not a badge asking for attention.
---

Labels are catalog-style: short, mono, uppercase — `SAVED`, `RECOMMENDED`,
`OVERDUE`. Never a click handler on one; a Badge is a label, not a button.

A `<span>` is too generic to style bare — it shows up all over running prose
for unrelated reasons — so Badge keeps one class. Tone is an attribute, not a
modifier class.

## Tones

<figure class="example">
<figcaption>Tones</figcaption>
<div>
<span class="badge">Unassigned</span>
<span class="badge" data-tone="accent">Draft</span>
<span class="badge" data-tone="success">Saved</span>
<span class="badge" data-tone="danger">Overdue</span>
</div>
<details open><summary>Markup</summary>
<pre><code>&lt;span class=&quot;badge&quot;&gt;Unassigned&lt;/span&gt;
&lt;span class=&quot;badge&quot; data-tone=&quot;accent&quot;&gt;Draft&lt;/span&gt;
&lt;span class=&quot;badge&quot; data-tone=&quot;success&quot;&gt;Saved&lt;/span&gt;
&lt;span class=&quot;badge&quot; data-tone=&quot;danger&quot;&gt;Overdue&lt;/span&gt;</code></pre>
</details>
</figure>

## In a set

<figure class="example">
<figcaption>Badge set</figcaption>
<div>
<div class="badge-set">
  <span class="badge" data-tone="accent">Recommended</span>
  <span class="badge">Every 2 weeks</span>
  <span class="badge" data-tone="danger">3d overdue</span>
</div>
</div>
<details><summary>Markup</summary>
<pre><code>&lt;div class=&quot;badge-set&quot;&gt;
  &lt;span class=&quot;badge&quot; data-tone=&quot;accent&quot;&gt;Recommended&lt;/span&gt;
  &lt;span class=&quot;badge&quot;&gt;Every 2 weeks&lt;/span&gt;
  &lt;span class=&quot;badge&quot; data-tone=&quot;danger&quot;&gt;3d overdue&lt;/span&gt;
&lt;/div&gt;</code></pre>
</details>
</figure>

## Rules

- **A badge is never interactive.** No click handlers, no `<button>`, no cursor
  change. If it does something, it is a button that happens to be small.
- **Two or three words at most.** A badge that wraps is a sentence in the wrong clothes.
- **`danger` means something needs attention, not that something failed.** The
  source uses it for overdue, not for a system error — that is what prose is for.

## API

<table>
  <thead><tr><th scope="col">Element / attribute</th><th scope="col">Values</th><th scope="col">Notes</th></tr></thead>
  <tbody>
    <tr><td><code>span.badge</code></td><td></td><td>Required base.</td></tr>
    <tr><td><code>data-tone</code></td><td><code>accent | success | danger</code></td><td>Omit for the default neutral tone.</td></tr>
  </tbody>
</table>
