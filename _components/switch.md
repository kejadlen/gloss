---
title: Switch
summary: >-
  Toggle switch for on/off settings. The one moving part in this system —
  everything else transitions colour or border, never position.
---

## Basic

{% example title="Switch" open %}
<label class="ad-switch">
  <input type="checkbox" checked>
  <span class="ad-switch__track"></span>
  Dark mode
</label>
<label class="ad-switch">
  <input type="checkbox">
  <span class="ad-switch__track"></span>
  Weekly digest
</label>
{% endexample %}

## Disabled

{% example title="Disabled" %}
<label class="ad-switch">
  <input type="checkbox" checked disabled>
  <span class="ad-switch__track"></span>
  Always on for this plan
</label>
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
