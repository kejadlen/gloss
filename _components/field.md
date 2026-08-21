---
title: Field
summary: >-
  The labeled field wrapper. Mono, uppercase, tracked label — the same
  catalog-label convention as Badge and type-label — with an optional hint.
---

## Basic

{% example title="Field" open %}
<div class="ad-field" style="max-width: 20rem;">
  <label class="ad-field__label" for="field-name">Name</label>
  <input class="ad-input" id="field-name" type="text" placeholder="Call Mom">
  <span class="ad-field__hint">First line becomes the display name.</span>
</div>
{% endexample %}

## Holding any control

Field wraps [Input]({{ '/components/input/' | relative_url }}),
[Select]({{ '/components/select/' | relative_url }}), or anything else — it
only owns the label and the hint line, never the control's own styling.

{% example title="Field with a select" %}
<div class="ad-field" style="max-width: 20rem;">
  <label class="ad-field__label" for="field-unit">Unit</label>
  <select class="ad-select" id="field-unit">
    <option>Day</option>
    <option selected>Week</option>
    <option>Month</option>
    <option>Year</option>
  </select>
</div>
{% endexample %}

## In a row

{% example title="Two fields in a row" %}
<div class="ad-form" style="max-width: none;">
  <div class="ad-form__row">
    <div class="ad-field">
      <label class="ad-field__label" for="field-every">Every</label>
      <input class="ad-input" id="field-every" type="number" placeholder="2">
    </div>
    <div class="ad-field">
      <label class="ad-field__label" for="field-unit-2">Unit</label>
      <select class="ad-select" id="field-unit-2">
        <option>Day</option><option selected>Week</option><option>Month</option>
      </select>
    </div>
  </div>
</div>
{% endexample %}

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
