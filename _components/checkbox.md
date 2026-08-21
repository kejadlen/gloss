---
title: Checkbox
summary: Flat checkbox, fills with the accent when checked. No bounce.
---

## Basic

{% example title="Checkbox" open %}
<label class="ad-choice ad-choice--checkbox">
  <input type="checkbox">
  <span class="ad-choice__box"></span>
  Notify me
</label>
<label class="ad-choice ad-choice--checkbox">
  <input type="checkbox" checked>
  <span class="ad-choice__box">
    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M20 6 9 17l-5-5"/></svg>
  </span>
  Ship on merge
</label>
{% endexample %}

## Disabled

{% example title="Disabled" %}
<label class="ad-choice ad-choice--checkbox" aria-disabled="true">
  <input type="checkbox" disabled>
  <span class="ad-choice__box"></span>
  Not available on this plan
</label>
{% endexample %}

## In a fieldset

{% example title="Fieldset" %}
<fieldset class="ad-fieldset">
  <legend>Notify me about</legend>
  <label class="ad-choice ad-choice--checkbox">
    <input type="checkbox" checked>
    <span class="ad-choice__box"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M20 6 9 17l-5-5"/></svg></span>
    Overdue tasks
  </label>
  <label class="ad-choice ad-choice--checkbox">
    <input type="checkbox">
    <span class="ad-choice__box"></span>
    Weekly digest
  </label>
</fieldset>
{% endexample %}

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
