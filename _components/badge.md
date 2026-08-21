---
title: Badge
summary: >-
  Mono, uppercase, tracked — the catalog-label convention for status and meta
  values. An archivist's tag, not a badge asking for attention.
---

Labels are catalog-style: short, mono, uppercase — `SAVED`, `RECOMMENDED`,
`OVERDUE`. Never a click handler on one; a Badge is a label, not a button.

## Tones

<figure class="example">
<figcaption>Tones</figcaption>
<div>
<span class="ad-badge">Unassigned</span>
<span class="ad-badge ad-badge--accent">Draft</span>
<span class="ad-badge ad-badge--success">Saved</span>
<span class="ad-badge ad-badge--danger">Overdue</span>
</div>
<details open><summary>Markup</summary>
<pre><code>&lt;span class=&quot;ad-badge&quot;&gt;Unassigned&lt;/span&gt;
&lt;span class=&quot;ad-badge ad-badge--accent&quot;&gt;Draft&lt;/span&gt;
&lt;span class=&quot;ad-badge ad-badge--success&quot;&gt;Saved&lt;/span&gt;
&lt;span class=&quot;ad-badge ad-badge--danger&quot;&gt;Overdue&lt;/span&gt;</code></pre>
</details>
</figure>

## In a set

<figure class="example">
<figcaption>Badge set</figcaption>
<div>
<div class="ad-badge-set">
  <span class="ad-badge ad-badge--accent">Recommended</span>
  <span class="ad-badge">Every 2 weeks</span>
  <span class="ad-badge ad-badge--danger">3d overdue</span>
</div>
</div>
<details><summary>Markup</summary>
<pre><code>&lt;div class=&quot;ad-badge-set&quot;&gt;
  &lt;span class=&quot;ad-badge ad-badge--accent&quot;&gt;Recommended&lt;/span&gt;
  &lt;span class=&quot;ad-badge&quot;&gt;Every 2 weeks&lt;/span&gt;
  &lt;span class=&quot;ad-badge ad-badge--danger&quot;&gt;3d overdue&lt;/span&gt;
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

<div class="ad-table-wrap">
  <table class="ad-table ad-table--compact">
    <thead><tr><th scope="col">Prop</th><th scope="col">Type</th><th scope="col">Notes</th></tr></thead>
    <tbody>
      <tr><td class="ad-token-name">tone</td><td class="ad-table__code">neutral | accent | success | danger</td><td>Default <code>neutral</code>.</td></tr>
    </tbody>
  </table>
</div>
