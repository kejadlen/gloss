---
title: Button
summary: >-
  Four variants, three sizes, one geometry. Every variant sets three private
  custom properties and inherits everything else, so a mixed row still aligns.
---

## Variants

Rank them by how much you want the reader to do them. One primary per view, at
most. If a screen has two primary buttons, one of them is lying.

{% example title="Variants" open %}
<button type="button" class="ad-btn ad-btn--primary">Publish</button>
<button type="button" class="ad-btn ad-btn--secondary">Save draft</button>
<button type="button" class="ad-btn ad-btn--ghost">Cancel</button>
<button type="button" class="ad-btn ad-btn--danger">Delete</button>
{% endexample %}

## Sizes

{% example title="Sizes" %}
<button type="button" class="ad-btn ad-btn--primary ad-btn--sm">Small</button>
<button type="button" class="ad-btn ad-btn--primary">Medium</button>
<button type="button" class="ad-btn ad-btn--primary ad-btn--lg">Large</button>
{% endexample %}

The three sizes exist for three contexts: `sm` inside a table row or a card
footer, the default in a form, `lg` for a single call to action in a hero. They
are not a way to signal importance — that is what variants are for.

## States

Disabled buttons drop to 45% opacity and keep their variant colours, so a
disabled primary still reads as the primary. The loading state replaces the
label with a spinner without changing the button's width, which stops the row
from reflowing mid-click.

{% example title="States" %}
<button type="button" class="ad-btn ad-btn--primary" disabled>Disabled</button>
<button type="button" class="ad-btn ad-btn--secondary" aria-disabled="true">Not yet available</button>
<button type="button" class="ad-btn ad-btn--primary" data-demo-loading>Click to load</button>
{% endexample %}

<div class="ad-callout ad-callout--caution">
  <div class="ad-callout__body">
    <p class="ad-callout__title"><code>disabled</code> versus <code>aria-disabled</code></p>
    <p style="margin:0">
      A <code>disabled</code> button is removed from the tab order, so a reader
      navigating by keyboard never learns it is there. When the button is
      temporarily unavailable and the reason matters, use
      <code>aria-disabled="true"</code> instead: it stays focusable, still
      announces as disabled, and can carry an explanation.
    </p>
  </div>
</div>

## With an icon

Icons sit before the label. The gap is `--ad-space-2`, set by the button itself,
so no icon needs its own margin.

{% example title="Icons" %}
<button type="button" class="ad-btn ad-btn--secondary">
  <svg width="14" height="14" viewBox="0 0 24 24" fill="none" aria-hidden="true">
    <path d="M12 5v14M5 12h14" stroke="currentColor" stroke-width="2.5" stroke-linecap="round"/>
  </svg>
  Add token
</button>
<button type="button" class="ad-btn ad-btn--secondary ad-btn--icon" aria-label="Open settings">
  <svg width="16" height="16" viewBox="0 0 24 24" fill="none" aria-hidden="true">
    <circle cx="12" cy="12" r="3" stroke="currentColor" stroke-width="2"/>
    <path d="M12 2.5v3M12 18.5v3M3.6 7.2l2.6 1.5M17.8 15.3l2.6 1.5M3.6 16.8l2.6-1.5M17.8 8.7l2.6-1.5"
          stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
  </svg>
</button>
{% endexample %}

An icon-only button always needs an `aria-label`. There is no visible text to
fall back on, and a tooltip is not an accessible name.

## Groups

{% example title="Button group" %}
<div class="ad-btn-group" role="group" aria-label="Text alignment">
  <button type="button" class="ad-btn ad-btn--secondary ad-btn--sm">Left</button>
  <button type="button" class="ad-btn ad-btn--secondary ad-btn--sm">Centre</button>
  <button type="button" class="ad-btn ad-btn--secondary ad-btn--sm">Right</button>
</div>
{% endexample %}

## Full width

{% example title="Block" layout="stack" %}
<button type="button" class="ad-btn ad-btn--primary ad-btn--block">Continue</button>
<button type="button" class="ad-btn ad-btn--ghost ad-btn--block">Use a different account</button>
{% endexample %}

## Links that look like buttons

An `<a>` with `.ad-btn` is fine when the thing it does is navigate. A `<button>`
is required when it changes something. Getting this backwards breaks
middle-click, Cmd-click, and the reader's expectations all at once.

{% example title="Anchor as button" %}
<a class="ad-btn ad-btn--primary" href="{{ '/components/field/' | relative_url }}">Next: Field</a>
<a class="ad-btn ad-btn--ghost" href="{{ '/foundations/color/' | relative_url }}">Back to colour</a>
{% endexample %}

## API

<div class="ad-table-wrap">
  <table class="ad-table ad-table--compact">
    <thead><tr><th scope="col">Class</th><th scope="col">Effect</th></tr></thead>
    <tbody>
      <tr><td class="ad-token-name">.ad-btn</td><td>Required base. Sets geometry, focus, and transitions.</td></tr>
      <tr><td class="ad-token-name">.ad-btn--primary</td><td>Filled accent. One per view.</td></tr>
      <tr><td class="ad-token-name">.ad-btn--secondary</td><td>Bordered surface. The workhorse.</td></tr>
      <tr><td class="ad-token-name">.ad-btn--ghost</td><td>No border, muted label. For dismissals and tertiary actions.</td></tr>
      <tr><td class="ad-token-name">.ad-btn--danger</td><td>Filled critical. Only for destructive, irreversible actions.</td></tr>
      <tr><td class="ad-token-name">.ad-btn--sm / --lg</td><td>Height, padding, and font size in one step.</td></tr>
      <tr><td class="ad-token-name">.ad-btn--icon</td><td>Square footprint for a lone glyph. Needs an <code>aria-label</code>.</td></tr>
      <tr><td class="ad-token-name">.ad-btn--block</td><td>Full width of its container.</td></tr>
      <tr><td class="ad-token-name">[data-loading="true"]</td><td>Hides the label and shows a spinner at the same width.</td></tr>
    </tbody>
  </table>
</div>
