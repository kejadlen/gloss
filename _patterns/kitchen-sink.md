---
title: Kitchen sink
summary: >-
  Every component the system ships, on one page, in both themes. This is the page
  to open after changing a token.
---

A kitchen sink is not documentation — nobody learns a system from this page. It
is a regression test you can look at. Change a token, open this, toggle the
theme, and see what broke.

## Buttons

{% example no-source %}
<button type="button" class="ad-btn ad-btn--primary">Primary</button>
<button type="button" class="ad-btn ad-btn--secondary">Secondary</button>
<button type="button" class="ad-btn ad-btn--ghost">Ghost</button>
<button type="button" class="ad-btn ad-btn--danger">Danger</button>
<button type="button" class="ad-btn ad-btn--primary" disabled>Disabled</button>
<button type="button" class="ad-btn ad-btn--primary ad-btn--sm">Small</button>
<button type="button" class="ad-btn ad-btn--primary ad-btn--lg">Large</button>
<div class="ad-btn-group" role="group" aria-label="Alignment">
  <button type="button" class="ad-btn ad-btn--secondary ad-btn--sm">One</button>
  <button type="button" class="ad-btn ad-btn--secondary ad-btn--sm">Two</button>
  <button type="button" class="ad-btn ad-btn--secondary ad-btn--sm">Three</button>
</div>
{% endexample %}

## Badges

{% example no-source %}
<span class="ad-badge">Neutral</span>
<span class="ad-badge ad-badge--accent">Accent</span>
<span class="ad-badge ad-badge--positive"><span class="ad-badge__dot"></span>Positive</span>
<span class="ad-badge ad-badge--caution"><span class="ad-badge__dot"></span>Caution</span>
<span class="ad-badge ad-badge--critical"><span class="ad-badge__dot"></span>Critical</span>
<span class="ad-badge ad-badge--info">Info</span>
<span class="ad-badge ad-badge--pill ad-badge--solid ad-badge--positive">Solid pill</span>
<span class="ad-avatar ad-avatar--sm">ad</span>
<span class="ad-avatar">ad</span>
{% endexample %}

## Controls

{% example no-source layout="stack" %}
<div class="ad-form" style="max-width: none;">
  <div class="ad-form__row">
    <div class="ad-field">
      <label class="ad-field__label" for="ks-text">Text</label>
      <input class="ad-input" id="ks-text" type="text" placeholder="Placeholder">
    </div>
    <div class="ad-field">
      <label class="ad-field__label" for="ks-select">Select</label>
      <select class="ad-select" id="ks-select"><option>One</option><option>Two</option></select>
    </div>
    <div class="ad-field">
      <label class="ad-field__label" for="ks-invalid">Invalid</label>
      <input class="ad-input" id="ks-invalid" type="text" value="nope" aria-invalid="true" aria-describedby="ks-invalid-error">
      <p class="ad-field__error" id="ks-invalid-error">Something is wrong.</p>
    </div>
  </div>
  <div class="ad-form__row">
    <label class="ad-choice"><input type="checkbox" checked> <span class="ad-choice__text">Checkbox</span></label>
    <label class="ad-choice"><input type="radio" name="ks-radio" checked> <span class="ad-choice__text">Radio</span></label>
    <label class="ad-switch"><input type="checkbox" checked><span class="ad-switch__track"></span><span>Switch</span></label>
  </div>
  <div class="ad-field">
    <label class="ad-field__label" for="ks-textarea">Textarea</label>
    <textarea class="ad-textarea" id="ks-textarea">Multi-line value.</textarea>
  </div>
</div>
{% endexample %}

## Callouts

{% example no-source layout="stack" %}
<div class="ad-callout ad-callout--info" style="margin:0"><div class="ad-callout__body"><p class="ad-callout__title">Info</p><p style="margin:0">Neutral notice.</p></div></div>
<div class="ad-callout ad-callout--positive" style="margin:0"><div class="ad-callout__body"><p class="ad-callout__title">Positive</p><p style="margin:0">It worked.</p></div></div>
<div class="ad-callout ad-callout--caution" style="margin:0"><div class="ad-callout__body"><p class="ad-callout__title">Caution</p><p style="margin:0">It might not work.</p></div></div>
<div class="ad-callout ad-callout--critical" style="margin:0"><div class="ad-callout__body"><p class="ad-callout__title">Critical</p><p style="margin:0">It did not work.</p></div></div>
<div class="ad-callout ad-callout--accent" style="margin:0"><div class="ad-callout__body"><p class="ad-callout__title">Accent</p><p style="margin:0">Read this one.</p></div></div>
<div class="ad-callout ad-callout--neutral" style="margin:0"><div class="ad-callout__body"><p style="margin:0">Neutral aside with no title.</p></div></div>
{% endexample %}

## Cards, table, progress

{% example no-source layout="stack" surface="sunken" %}
<div class="ad-card-grid">
  <article class="ad-card"><div class="ad-card__body"><h3 class="ad-card__title">Bordered</h3><p class="ad-card__text">Flat.</p></div></article>
  <article class="ad-card ad-card--raised"><div class="ad-card__body"><h3 class="ad-card__title">Raised</h3><p class="ad-card__text">Elevation 1.</p></div></article>
  <article class="ad-card ad-card--floating"><div class="ad-card__body"><h3 class="ad-card__title">Floating</h3><p class="ad-card__text">Elevation 2.</p></div></article>
</div>

<div class="ad-table-wrap">
  <table class="ad-table ad-table--hover ad-table--compact">
    <thead><tr><th scope="col">Token</th><th scope="col">Tone</th><th scope="col" class="ad-table__num">Steps</th></tr></thead>
    <tbody>
      <tr><td class="ad-table__code">--ad-color-accent</td><td><span class="ad-badge ad-badge--accent">accent</span></td><td class="ad-table__num">11</td></tr>
      <tr><td class="ad-table__code">--ad-color-positive</td><td><span class="ad-badge ad-badge--positive">positive</span></td><td class="ad-table__num">11</td></tr>
      <tr><td class="ad-table__code">--ad-color-critical</td><td><span class="ad-badge ad-badge--critical">critical</span></td><td class="ad-table__num">11</td></tr>
    </tbody>
  </table>
</div>

<div class="ad-progress" style="max-width: none;">
  <div class="ad-progress__label"><span id="ks-progress">Determinate</span><span class="ad-progress__value">42%</span></div>
  <div class="ad-progress__track" role="progressbar" aria-labelledby="ks-progress" aria-valuenow="42" aria-valuemin="0" aria-valuemax="100">
    <div class="ad-progress__fill" style="width: 42%;"></div>
  </div>
</div>
<div class="ad-progress ad-progress--indeterminate" style="max-width: none;">
  <div class="ad-progress__label"><span id="ks-progress-2">Indeterminate</span></div>
  <div class="ad-progress__track" role="progressbar" aria-labelledby="ks-progress-2"><div class="ad-progress__fill"></div></div>
</div>
{% endexample %}

## Typography

{% example no-source layout="stack" %}
<div>
  <p class="ad-overline">Overline</p>
  <h1 style="font-size: var(--ad-text-3xl);">Heading one</h1>
  <h2 style="border:0; padding:0; margin: var(--ad-space-3) 0 0;">Heading two</h2>
  <h3 style="margin: var(--ad-space-3) 0 0;">Heading three</h3>
  <p class="ad-lead" style="margin-top: var(--ad-space-3);">A lead paragraph, one step up the ramp and one step down the colour scale.</p>
  <p>Body copy with <a href="#main">a link</a>, <strong>bold text</strong>, <code>inline code</code>, and a <kbd>⌘K</kbd> key.</p>
  <blockquote>A blockquote, marked by an accent rule rather than an indent.</blockquote>
  <p class="ad-muted">Muted text.</p>
  <p class="ad-subtle">Subtle text.</p>
</div>
{% endexample %}
