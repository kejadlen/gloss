---
title: IconButton
summary: >-
  A square icon-only button. Always pass a label — it becomes the accessible
  name and the native tooltip, since there is no visible text to fall back on.
---

## Variants

`ghost` is the default and transparent. `outline` is a bordered surface, for
an icon button sitting alone rather than in a toolbar. `accent` is a soft
accent tint, for a toggled or active state — the segmented-tabs pattern this
system does not otherwise reach for.

{% example title="Variants" open %}
<button type="button" class="ad-icon-btn" aria-label="Delete">
  <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M4 7h16M9 7V4h6v3M6 7l1 13h10l1-13"/></svg>
</button>
<button type="button" class="ad-icon-btn ad-icon-btn--outline" aria-label="Settings">
  <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><circle cx="12" cy="12" r="3"/><path d="M12 2.5v3M12 18.5v3M3.6 7.2l2.6 1.5M17.8 15.3l2.6 1.5M3.6 16.8l2.6-1.5M17.8 8.7l2.6-1.5"/></svg>
</button>
<button type="button" class="ad-icon-btn ad-icon-btn--accent" aria-label="Filter (active)">
  <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M4 5h16l-6 8v5l-4 2v-7z"/></svg>
</button>
{% endexample %}

## Sizes

{% example title="Sizes" %}
<button type="button" class="ad-icon-btn ad-icon-btn--outline ad-icon-btn--sm" aria-label="Back"><svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.9" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M15 18l-6-6 6-6"/></svg></button>
<button type="button" class="ad-icon-btn ad-icon-btn--outline" aria-label="Back"><svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.9" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M15 18l-6-6 6-6"/></svg></button>
<button type="button" class="ad-icon-btn ad-icon-btn--outline ad-icon-btn--lg" aria-label="Back"><svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.9" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M15 18l-6-6 6-6"/></svg></button>
{% endexample %}

## Paired with Tooltip

An icon-only control almost always wants a [Tooltip]({{ '/components/tooltip/' | relative_url }}) too — the `aria-label` covers accessibility, the tooltip covers a sighted mouse user glancing for a hint.

{% example title="With a tooltip" %}
<span class="ad-tooltip">
  <button type="button" class="ad-icon-btn" aria-label="Delete">
    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M4 7h16M9 7V4h6v3M6 7l1 13h10l1-13"/></svg>
  </button>
  <span class="ad-tooltip__bubble">Delete</span>
</span>
{% endexample %}

## API

<div class="ad-table-wrap">
  <table class="ad-table ad-table--compact">
    <thead><tr><th scope="col">Prop</th><th scope="col">Type</th><th scope="col">Notes</th></tr></thead>
    <tbody>
      <tr><td class="ad-token-name">icon</td><td class="ad-table__code">node</td><td>Required.</td></tr>
      <tr><td class="ad-token-name">label</td><td class="ad-table__code">string</td><td>Required — becomes <code>aria-label</code> and <code>title</code>.</td></tr>
      <tr><td class="ad-token-name">size</td><td class="ad-table__code">sm | md | lg</td><td>28 / 34 / 40px square.</td></tr>
      <tr><td class="ad-token-name">variant</td><td class="ad-table__code">ghost | outline | accent</td><td>Default <code>ghost</code>.</td></tr>
    </tbody>
  </table>
</div>
