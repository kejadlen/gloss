---
title: Badge
summary: >-
  A label with a background. Six tones, two shapes, and a dot for the times when
  colour alone will not do.
---

## Tones

{% example title="Tones" open %}
<span class="ad-badge">Neutral</span>
<span class="ad-badge ad-badge--accent">Accent</span>
<span class="ad-badge ad-badge--positive">Positive</span>
<span class="ad-badge ad-badge--caution">Caution</span>
<span class="ad-badge ad-badge--critical">Critical</span>
<span class="ad-badge ad-badge--info">Info</span>
{% endexample %}

Each tone pulls the whole status triple — foreground, tint, edge — from the same
tokens the callout uses. A caution badge and a caution callout on the same page
cannot drift apart, because there is only one definition of caution.

## Shapes

{% example title="Square and pill, outline and solid" %}
<span class="ad-badge ad-badge--positive">Passing</span>
<span class="ad-badge ad-badge--positive ad-badge--pill">Passing</span>
<span class="ad-badge ad-badge--positive ad-badge--solid">Passing</span>
<span class="ad-badge ad-badge--positive ad-badge--pill ad-badge--solid">Passing</span>
{% endexample %}

Square badges read as metadata attached to something. Pills read as free-standing
tags. Pick one per surface and stay with it.

## Status with a dot

Colour on its own excludes anyone who cannot distinguish the hues, and it also
fails on a greyscale print. The dot is not decoration — it is a second channel
that a text label can attach to.

{% example title="Status" %}
<span class="ad-badge ad-badge--positive"><span class="ad-badge__dot"></span>Deployed</span>
<span class="ad-badge ad-badge--caution"><span class="ad-badge__dot"></span>Degraded</span>
<span class="ad-badge ad-badge--critical"><span class="ad-badge__dot"></span>Down</span>
<span class="ad-badge"><span class="ad-badge__dot"></span>Unknown</span>
{% endexample %}

## In context

{% example title="Badges in a table" layout="stack" %}
<div class="ad-table-wrap">
  <table class="ad-table ad-table--hover">
    <thead>
      <tr><th scope="col">Token</th><th scope="col">Status</th><th scope="col">Since</th></tr>
    </thead>
    <tbody>
      <tr>
        <td class="ad-table__code">--ad-color-accent</td>
        <td><span class="ad-badge ad-badge--positive"><span class="ad-badge__dot"></span>Stable</span></td>
        <td>v1.0.0</td>
      </tr>
      <tr>
        <td class="ad-table__code">--ad-color-surface-hover</td>
        <td><span class="ad-badge ad-badge--caution"><span class="ad-badge__dot"></span>Experimental</span></td>
        <td>v1.0.0</td>
      </tr>
      <tr>
        <td class="ad-table__code">--ad-shadow-soft</td>
        <td><span class="ad-badge ad-badge--critical"><span class="ad-badge__dot"></span>Removed</span></td>
        <td>v0.9.0</td>
      </tr>
    </tbody>
  </table>
</div>
{% endexample %}

## Rules

- **A badge is never interactive.** No click handlers, no `<button>`, no cursor
  change. If it does something, it is a button that happens to be small.
- **Two words at most.** A badge that wraps is a sentence in the wrong clothes.
- **Solid badges are for counts and hard states**, outline for everything else.
  A page of solid badges is a page of alarms.
