---
title: Tabs
summary: >-
  The WAI-ARIA tabs pattern, wired up in about forty lines of vanilla JavaScript.
  Arrows move between tabs, Home and End jump to the ends.
---

## Tabs

{% example title="Tabs" layout="stack" open %}
<div class="ad-tabs" data-tabs>
  <div class="ad-tabs__list" role="tablist" aria-label="Token formats">
    <button class="ad-tabs__tab" role="tab" id="tab-css" aria-controls="panel-css" aria-selected="true" type="button">CSS</button>
    <button class="ad-tabs__tab" role="tab" id="tab-yaml" aria-controls="panel-yaml" aria-selected="false" tabindex="-1" type="button">YAML</button>
    <button class="ad-tabs__tab" role="tab" id="tab-ruby" aria-controls="panel-ruby" aria-selected="false" tabindex="-1" type="button">Ruby</button>
  </div>

  <div class="ad-tabs__panel" role="tabpanel" id="panel-css" aria-labelledby="tab-css" tabindex="0">
    <p style="margin:0">What the build emits — one flat block of custom properties.</p>
    <pre style="margin: var(--ad-space-3) 0 0; padding: var(--ad-space-3); background: var(--ad-color-surface-sunken); border-radius: var(--ad-radius-sm); font-size: var(--ad-text-xs); overflow-x: auto;"><code>:root {
  --ad-color-accent: #c2260c;
  --ad-color-accent-hover: #9a2012;
}</code></pre>
  </div>

  <div class="ad-tabs__panel" role="tabpanel" id="panel-yaml" aria-labelledby="tab-yaml" tabindex="0" hidden>
    <p style="margin:0">What a person edits — a reference into a ramp, never a hex.</p>
    <pre style="margin: var(--ad-space-3) 0 0; padding: var(--ad-space-3); background: var(--ad-color-surface-sunken); border-radius: var(--ad-radius-sm); font-size: var(--ad-text-xs); overflow-x: auto;"><code>- token: color-accent
  light: persimmon.700
  dark: persimmon.400</code></pre>
  </div>

  <div class="ad-tabs__panel" role="tabpanel" id="panel-ruby" aria-labelledby="tab-ruby" tabindex="0" hidden>
    <p style="margin:0">What connects them — a generator that runs before Jekyll renders a page.</p>
    <pre style="margin: var(--ad-space-3) 0 0; padding: var(--ad-space-3); background: var(--ad-color-surface-sunken); border-radius: var(--ad-radius-sm); font-size: var(--ad-text-xs); overflow-x: auto;"><code>site.pages &lt;&lt; stylesheet(site, token_set)</code></pre>
  </div>
</div>
{% endexample %}

## The contract

The JavaScript looks for `[data-tabs]` and takes over from there, but it will
only do the right thing if the markup is right:

<div class="ad-table-wrap">
  <table class="ad-table ad-table--compact">
    <thead><tr><th scope="col">Element</th><th scope="col">Needs</th></tr></thead>
    <tbody>
      <tr><td>Wrapper</td><td class="ad-table__code">data-tabs</td></tr>
      <tr><td>List</td><td class="ad-table__code">role="tablist"</td></tr>
      <tr><td>Tab</td><td class="ad-table__code">role="tab", id, aria-controls, aria-selected</td></tr>
      <tr><td>Panel</td><td class="ad-table__code">role="tabpanel", id, aria-labelledby, tabindex="0"</td></tr>
    </tbody>
  </table>
</div>

Only the selected tab stays in the tab order; the rest get `tabindex="-1"` and
are reached with the arrow keys. That is one Tab stop for the whole tablist,
which is the point of the pattern.

<div class="ad-callout ad-callout--caution">
  <div class="ad-callout__body">
    <p class="ad-callout__title">Tabs are not navigation</p>
    <p style="margin:0">
      If each panel deserves its own URL — if a reader might want to link to one,
      or hit Back to leave it — it is a set of pages with a nav, not a tablist.
      This site's sidebar is nav; the block above is tabs.
    </p>
  </div>
</div>

## Rules

- **The selected panel is the only one not `hidden`.** Do not hide panels with
  CSS alone; `hidden` keeps them out of the accessibility tree.
- **Never more than about six tabs.** Past that the labels stop fitting and the
  arrow keys stop being faster than reading.
- **Keep panel heights close.** A tablist that resizes the page on every switch
  makes the reader lose their place.
