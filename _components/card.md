---
title: Card
summary: >-
  Flat surface, hairline border, radius-lg. Elevation is opt-in, reserved for
  the one focused card in a view — a dialog, the primary capture card.
---

## Flat vs. elevated

Flat is the default everywhere. `--elevated` is for the single most-elevated
element on screen — never a whole grid of cards at once.

{% example title="Flat and elevated" surface="sunken" %}
<div class="ad-card" style="width: 14rem; padding: var(--ad-space-s);">Flat — the default.</div>
<div class="ad-card ad-card--elevated" style="width: 14rem; padding: var(--ad-space-s);">Elevated — one per view.</div>
{% endexample %}

## As a content tile

{% example title="Content tile" %}
<article class="ad-card" style="max-width: 18rem;">
  <div class="ad-card__body">
    <p class="type-label">Recommended</p>
    <h3 class="ad-card__title">Rename the caution colour</h3>
    <p class="ad-card__text">Three people have called it "yellow" in review this month.</p>
  </div>
  <div class="ad-card__footer">
    <button type="button" class="ad-btn ad-btn--primary ad-btn--sm">Approve</button>
    <button type="button" class="ad-btn ad-btn--ghost ad-btn--sm">Dismiss</button>
  </div>
</article>
{% endexample %}

## As a list — with CardRow

Card's most common job in this system is holding a list of
[CardRow]({{ '/components/card-row/' | relative_url }})s: entry lists, task
lists, settings rows.

{% example title="Card of rows" %}
<div class="ad-card" style="max-width: 22rem;">
  <div class="ad-card-row">Dishwasher manual</div>
  <div class="ad-card-row">Sofa receipt</div>
  <div class="ad-card-row">Passport scan</div>
</div>
{% endexample %}

## API

<div class="ad-table-wrap">
  <table class="ad-table ad-table--compact">
    <thead><tr><th scope="col">Prop</th><th scope="col">Type</th><th scope="col">Notes</th></tr></thead>
    <tbody>
      <tr><td class="ad-token-name">elevated</td><td class="ad-table__code">boolean</td><td>Applies <code>--ad-shadow-float</code>. One per view.</td></tr>
    </tbody>
  </table>
</div>
