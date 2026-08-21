---
title: Card
summary: >-
  Flat surface, hairline border, radius-lg. Elevation is opt-in, reserved for
  the one focused card in a view — a dialog, the primary capture card.
---

## Flat vs. elevated

Flat is the default everywhere. `--elevated` is for the single most-elevated
element on screen — never a whole grid of cards at once.

<figure class="example">
<figcaption>Flat and elevated</figcaption>
<div data-surface="sunken">
<div class="ad-card" style="width: 14rem; padding: var(--ad-space-s);">Flat — the default.</div>
<div class="ad-card ad-card--elevated" style="width: 14rem; padding: var(--ad-space-s);">Elevated — one per view.</div>
</div>
<details><summary>Markup</summary>
<pre><code>&lt;div class=&quot;ad-card&quot; style=&quot;width: 14rem; padding: var(--ad-space-s);&quot;&gt;Flat — the default.&lt;/div&gt;
&lt;div class=&quot;ad-card ad-card--elevated&quot; style=&quot;width: 14rem; padding: var(--ad-space-s);&quot;&gt;Elevated — one per view.&lt;/div&gt;</code></pre>
</details>
</figure>

## As a content tile

<figure class="example">
<figcaption>Content tile</figcaption>
<div>
<article class="ad-card" style="max-width: 18rem;">
  <div class="ad-card__body">
    <p class="type-label">Recommended</p>
    <h3 class="ad-card__title">Rename the caution color</h3>
    <p class="ad-card__text">Three people have called it "yellow" in review this month.</p>
  </div>
  <div class="ad-card__footer">
    <button type="button" class="ad-btn ad-btn--primary ad-btn--sm">Approve</button>
    <button type="button" class="ad-btn ad-btn--ghost ad-btn--sm">Dismiss</button>
  </div>
</article>
</div>
<details><summary>Markup</summary>
<pre><code>&lt;article class=&quot;ad-card&quot; style=&quot;max-width: 18rem;&quot;&gt;
  &lt;div class=&quot;ad-card__body&quot;&gt;
    &lt;p class=&quot;type-label&quot;&gt;Recommended&lt;/p&gt;
    &lt;h3 class=&quot;ad-card__title&quot;&gt;Rename the caution color&lt;/h3&gt;
    &lt;p class=&quot;ad-card__text&quot;&gt;Three people have called it &quot;yellow&quot; in review this month.&lt;/p&gt;
  &lt;/div&gt;
  &lt;div class=&quot;ad-card__footer&quot;&gt;
    &lt;button type=&quot;button&quot; class=&quot;ad-btn ad-btn--primary ad-btn--sm&quot;&gt;Approve&lt;/button&gt;
    &lt;button type=&quot;button&quot; class=&quot;ad-btn ad-btn--ghost ad-btn--sm&quot;&gt;Dismiss&lt;/button&gt;
  &lt;/div&gt;
&lt;/article&gt;</code></pre>
</details>
</figure>

## As a list — with CardRow

Card's most common job in this system is holding a list of
[CardRow](<%= relative_url('/components/card-row/') %>)s: entry lists, task
lists, settings rows.

<figure class="example">
<figcaption>Card of rows</figcaption>
<div>
<div class="ad-card" style="max-width: 22rem;">
  <div class="ad-card-row">Dishwasher manual</div>
  <div class="ad-card-row">Sofa receipt</div>
  <div class="ad-card-row">Passport scan</div>
</div>
</div>
<details><summary>Markup</summary>
<pre><code>&lt;div class=&quot;ad-card&quot; style=&quot;max-width: 22rem;&quot;&gt;
  &lt;div class=&quot;ad-card-row&quot;&gt;Dishwasher manual&lt;/div&gt;
  &lt;div class=&quot;ad-card-row&quot;&gt;Sofa receipt&lt;/div&gt;
  &lt;div class=&quot;ad-card-row&quot;&gt;Passport scan&lt;/div&gt;
&lt;/div&gt;</code></pre>
</details>
</figure>

## API

<div class="ad-table-wrap">
  <table class="ad-table ad-table--compact">
    <thead><tr><th scope="col">Prop</th><th scope="col">Type</th><th scope="col">Notes</th></tr></thead>
    <tbody>
      <tr><td class="ad-token-name">elevated</td><td class="ad-table__code">boolean</td><td>Applies <code>--ad-shadow-float</code>. One per view.</td></tr>
    </tbody>
  </table>
</div>
