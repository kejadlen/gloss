---
title: Input
summary: >-
  A bordered text input, styled to match Select exactly. Usually wrapped in
  Field for its label and hint.
---

## Basic

{% example title="Input" open %}
<input class="ad-input" type="text" placeholder="Dishwasher manual" style="max-width: 20rem;">
{% endexample %}

## Focus and disabled

{% example title="States" layout="stack" %}
<input class="ad-input" type="text" value="Focused" style="max-width: 20rem; border-color: var(--ad-color-accent); box-shadow: 0 0 0 2px var(--ad-color-accent-soft);">
<input class="ad-input" type="text" value="Disabled" disabled style="max-width: 20rem;">
{% endexample %}

## Invalid

Invalid state is expressed on the control itself, so it works with native
form validation, plus an error line below.

{% example title="Invalid" %}
<div class="ad-field" style="max-width: 20rem;">
  <label class="ad-field__label" for="input-accent">Accent hex</label>
  <input class="ad-input" id="input-accent" type="text" value="not-a-colour" aria-invalid="true" aria-describedby="input-accent-error">
  <p class="ad-field__error" id="input-accent-error">Not a valid hex colour.</p>
</div>
{% endexample %}

## API

<div class="ad-table-wrap">
  <table class="ad-table ad-table--compact">
    <thead><tr><th scope="col">Prop</th><th scope="col">Type</th><th scope="col">Notes</th></tr></thead>
    <tbody>
      <tr><td class="ad-token-name">type</td><td class="ad-table__code">string</td><td>Any native input type.</td></tr>
      <tr><td class="ad-token-name">placeholder</td><td class="ad-table__code">string</td><td></td></tr>
      <tr><td class="ad-token-name">disabled</td><td class="ad-table__code">boolean</td><td></td></tr>
      <tr><td class="ad-token-name">aria-invalid</td><td class="ad-table__code">"true"</td><td>Reddens the border and fill.</td></tr>
    </tbody>
  </table>
</div>
