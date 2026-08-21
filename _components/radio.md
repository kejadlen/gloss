---
title: Radio
summary: Flat radio button, the same visual language as Checkbox.
---

## Basic

{% example title="Radio" open %}
<label class="ad-choice ad-choice--radio">
  <input type="radio" name="demo-radio-1" checked>
  <span class="ad-choice__box"></span>
  Weekly
</label>
<label class="ad-choice ad-choice--radio">
  <input type="radio" name="demo-radio-1">
  <span class="ad-choice__box"></span>
  Monthly
</label>
{% endexample %}

## As a group

{% example title="Interval" %}
<fieldset class="ad-fieldset">
  <legend>Repeat</legend>
  <label class="ad-choice ad-choice--radio">
    <input type="radio" name="demo-radio-2" checked>
    <span class="ad-choice__box"></span>
    Every week
  </label>
  <label class="ad-choice ad-choice--radio">
    <input type="radio" name="demo-radio-2">
    <span class="ad-choice__box"></span>
    Every month
  </label>
  <label class="ad-choice ad-choice--radio">
    <input type="radio" name="demo-radio-2">
    <span class="ad-choice__box"></span>
    Every year
  </label>
</fieldset>
{% endexample %}

## API

<div class="ad-table-wrap">
  <table class="ad-table ad-table--compact">
    <thead><tr><th scope="col">Prop</th><th scope="col">Type</th><th scope="col">Notes</th></tr></thead>
    <tbody>
      <tr><td class="ad-token-name">checked</td><td class="ad-table__code">boolean</td><td>Required.</td></tr>
      <tr><td class="ad-token-name">name</td><td class="ad-table__code">string</td><td>Groups mutually exclusive radios.</td></tr>
      <tr><td class="ad-token-name">label</td><td class="ad-table__code">node</td><td></td></tr>
    </tbody>
  </table>
</div>
