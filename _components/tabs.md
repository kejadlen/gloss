---
title: Tabs
summary: >-
  Two real variants: underline for primary section navigation, segmented for
  filters. The WAI-ARIA tabs pattern, wired up in vanilla JavaScript — arrows
  move, Home/End jump to the ends.
---

## Underline

Mono, with an accent underline. For primary section navigation — a project's
own tabs, never a filter.

{% example title="Underline" layout="stack" open %}
<div class="ad-tabs ad-tabs--underline" data-tabs>
  <div class="ad-tabs__list" role="tablist" aria-label="Repository">
    <button class="ad-tabs__tab" role="tab" id="tabs-code-tab" aria-controls="tabs-code-panel" aria-selected="true" tabindex="0">Code</button>
    <button class="ad-tabs__tab" role="tab" id="tabs-ci-tab" aria-controls="tabs-ci-panel" aria-selected="false" tabindex="-1">CI</button>
    <button class="ad-tabs__tab" role="tab" id="tabs-issues-tab" aria-controls="tabs-issues-panel" aria-selected="false" tabindex="-1">Issues</button>
  </div>
  <div class="ad-tabs__panel" role="tabpanel" id="tabs-code-panel" aria-labelledby="tabs-code-tab" tabindex="0">Repository contents.</div>
  <div class="ad-tabs__panel" role="tabpanel" id="tabs-ci-panel" aria-labelledby="tabs-ci-tab" tabindex="0" hidden>Build history.</div>
  <div class="ad-tabs__panel" role="tabpanel" id="tabs-issues-panel" aria-labelledby="tabs-issues-tab" tabindex="0" hidden>Open issues.</div>
</div>
{% endexample %}

## Segmented

A pill track; the active segment lifts to the surface. For filters — *All ·
Overdue · Upcoming* — never primary navigation.

{% example title="Segmented" layout="stack" %}
<div class="ad-tabs ad-tabs--segmented" data-tabs>
  <div class="ad-tabs__list" role="tablist" aria-label="Filter">
    <button class="ad-tabs__tab" role="tab" id="tabs-all-tab" aria-controls="tabs-all-panel" aria-selected="true" tabindex="0">All</button>
    <button class="ad-tabs__tab" role="tab" id="tabs-overdue-tab" aria-controls="tabs-overdue-panel" aria-selected="false" tabindex="-1">Overdue</button>
    <button class="ad-tabs__tab" role="tab" id="tabs-upcoming-tab" aria-controls="tabs-upcoming-panel" aria-selected="false" tabindex="-1">Upcoming</button>
  </div>
  <div class="ad-tabs__panel" role="tabpanel" id="tabs-all-panel" aria-labelledby="tabs-all-tab" tabindex="0">7 series.</div>
  <div class="ad-tabs__panel" role="tabpanel" id="tabs-overdue-panel" aria-labelledby="tabs-overdue-tab" tabindex="0" hidden>2 series.</div>
  <div class="ad-tabs__panel" role="tabpanel" id="tabs-upcoming-panel" aria-labelledby="tabs-upcoming-tab" tabindex="0" hidden>5 series.</div>
</div>
{% endexample %}

## Rules

- **Never both variants in one view.** Underline is for the page's own
  sections; segmented is for filtering what is already on screen.
- **Segmented is not primary navigation.** If it decides which screen the
  reader is on, it should be underline.

## API

<div class="ad-table-wrap">
  <table class="ad-table ad-table--compact">
    <thead><tr><th scope="col">Prop</th><th scope="col">Type</th><th scope="col">Notes</th></tr></thead>
    <tbody>
      <tr><td class="ad-token-name">items</td><td class="ad-table__code">{value, label}[]</td><td>Required.</td></tr>
      <tr><td class="ad-token-name">value</td><td class="ad-table__code">string</td><td>The selected item's value.</td></tr>
      <tr><td class="ad-token-name">variant</td><td class="ad-table__code">underline | segmented</td><td>Default <code>underline</code>.</td></tr>
    </tbody>
  </table>
</div>
