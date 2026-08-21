---
title: Callout
summary: >-
  Block-level messaging with an icon, a title, and a body. Five tones, the same
  five the badge uses.
---

## Tones

{% example title="Tones" layout="stack" open %}
<div class="ad-callout ad-callout--info">
  <svg class="ad-callout__icon" viewBox="0 0 24 24" fill="none" aria-hidden="true">
    <circle cx="12" cy="12" r="9.5" stroke="currentColor" stroke-width="2"/>
    <path d="M12 11v6M12 7.4v.2" stroke="currentColor" stroke-width="2.2" stroke-linecap="round"/>
  </svg>
  <div class="ad-callout__body">
    <p class="ad-callout__title">Tokens rebuild on every save</p>
    <p style="margin:0">Editing a hex in <code>_data/tokens/color.yml</code> updates the stylesheet, the swatch, and the contrast figure together.</p>
  </div>
</div>

<div class="ad-callout ad-callout--positive">
  <svg class="ad-callout__icon" viewBox="0 0 24 24" fill="none" aria-hidden="true">
    <circle cx="12" cy="12" r="9.5" stroke="currentColor" stroke-width="2"/>
    <path d="m7.8 12.3 2.7 2.7 5.7-5.7" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round"/>
  </svg>
  <div class="ad-callout__body">
    <p class="ad-callout__title">Contrast contract holding</p>
    <p style="margin:0">All {{ site.data.tokens.contrast.text.pairs | size }} text pairings clear WCAG AA in both themes.</p>
  </div>
</div>

<div class="ad-callout ad-callout--caution">
  <svg class="ad-callout__icon" viewBox="0 0 24 24" fill="none" aria-hidden="true">
    <path d="M12 3.6 21.4 20H2.6L12 3.6Z" stroke="currentColor" stroke-width="2" stroke-linejoin="round"/>
    <path d="M12 10v4M12 17.2v.2" stroke="currentColor" stroke-width="2.2" stroke-linecap="round"/>
  </svg>
  <div class="ad-callout__body">
    <p class="ad-callout__title">This ramp has no 150 step</p>
    <p style="margin:0">Ink defines one because its light end needed the extra resolution. The other ramps do not.</p>
  </div>
</div>

<div class="ad-callout ad-callout--critical" role="alert">
  <svg class="ad-callout__icon" viewBox="0 0 24 24" fill="none" aria-hidden="true">
    <circle cx="12" cy="12" r="9.5" stroke="currentColor" stroke-width="2"/>
    <path d="m8.6 8.6 6.8 6.8M15.4 8.6l-6.8 6.8" stroke="currentColor" stroke-width="2.2" stroke-linecap="round"/>
  </svg>
  <div class="ad-callout__body">
    <p class="ad-callout__title">Build failed: unknown token reference</p>
    <p style="margin:0"><code>persimmon.55</code> is not a step in the persimmon ramp.</p>
  </div>
</div>

<div class="ad-callout ad-callout--neutral">
  <div class="ad-callout__body">
    <p style="margin:0">A neutral callout with no icon and no title — for an aside that is not news, just context.</p>
  </div>
</div>
{% endexample %}

## Without an icon

The icon column collapses on its own when there is no icon, so a bare callout
needs no extra class.

{% example title="Body only" layout="stack" %}
<div class="ad-callout ad-callout--accent">
  <div class="ad-callout__body">
    <p style="margin:0">
      Every number on the colour page is computed during the build by
      <code>lib/arbitrary_definitions/color_math.rb</code>. Nothing on that page
      was typed by a person.
    </p>
  </div>
</div>
{% endexample %}

## Announcing a callout

A callout that appears in response to something the reader did needs
`role="alert"` (for errors) or `role="status"` (for confirmations), or a screen
reader will never mention it. A callout that was on the page from the start
needs neither, and adding one makes the page noisier for no benefit.

<div class="ad-table-wrap">
  <table class="ad-table ad-table--compact">
    <thead><tr><th scope="col">Situation</th><th scope="col">Role</th></tr></thead>
    <tbody>
      <tr><td>Static guidance in a document</td><td class="ad-table__code">none</td></tr>
      <tr><td>Confirmation after a successful action</td><td class="ad-table__code">status</td></tr>
      <tr><td>Error after a failed action</td><td class="ad-table__code">alert</td></tr>
      <tr><td>A warning present before the reader acts</td><td class="ad-table__code">none</td></tr>
    </tbody>
  </table>
</div>

## Rules

- **One callout per section.** Three stacked callouts are a wall, and readers
  skip walls.
- **The title is the message.** If the reader only reads the title, they should
  still know what happened.
- **Critical is for things that failed**, not for things that are merely
  important. Importance is what the surrounding prose is for.
