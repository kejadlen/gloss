---
title: Select
summary: Native select, styled to match Input exactly.
---

## Basic

{% example title="Select" open %}
<select class="ad-select" style="max-width: 20rem;">
  <option>Day</option>
  <option selected>Week</option>
  <option>Month</option>
  <option>Year</option>
</select>
{% endexample %}

## Disabled

{% example title="Disabled" %}
<select class="ad-select" disabled style="max-width: 20rem;"><option>Week</option></select>
{% endexample %}

<div class="ad-callout">
  <p style="margin:0; font-size: var(--ad-step--1);">
    The chevron is the one place in this component set that cannot reach a
    <code>var(--ad-*)</code> token — a data-URI <code>background-image</code>
    cannot reference a custom property, so its stroke is a literal hex, kept
    close to <code>--ad-color-text-secondary</code> and commented in the source.
  </p>
</div>

## API

<div class="ad-table-wrap">
  <table class="ad-table ad-table--compact">
    <thead><tr><th scope="col">Prop</th><th scope="col">Type</th><th scope="col">Notes</th></tr></thead>
    <tbody>
      <tr><td class="ad-token-name">options</td><td class="ad-table__code">{value, label}[]</td><td></td></tr>
      <tr><td class="ad-token-name">disabled</td><td class="ad-table__code">boolean</td><td></td></tr>
    </tbody>
  </table>
</div>
