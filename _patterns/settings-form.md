---
title: Settings form
summary: >-
  Ten components in one realistic screen. Everything below is system markup with
  no page-specific CSS beyond a couple of inline widths.
---

A pattern is what a design system is actually judged on. Individual components
looking tidy on a white background proves nothing; the question is whether they
hold together when a real screen puts nine of them side by side.

{% example title="Theme settings" layout="stack" surface="sunken" %}
<form class="ad-card ad-card--raised" style="max-width: 40rem;" onsubmit="return false;">
  <div class="ad-card__body" style="gap: var(--ad-space-5); padding: var(--ad-space-6);">

    <div>
      <p class="ad-overline">Workspace</p>
      <h2 style="font-size: var(--ad-text-xl); margin: var(--ad-space-1) 0 var(--ad-space-1);">Theme settings</h2>
      <p class="ad-card__text">How this workspace resolves design tokens at build time.</p>
    </div>

    <div class="ad-callout ad-callout--info" style="margin: 0;">
      <svg class="ad-callout__icon" viewBox="0 0 24 24" fill="none" aria-hidden="true">
        <circle cx="12" cy="12" r="9.5" stroke="currentColor" stroke-width="2"/>
        <path d="M12 11v6M12 7.4v.2" stroke="currentColor" stroke-width="2.2" stroke-linecap="round"/>
      </svg>
      <div class="ad-callout__body">
        <p style="margin:0">Changes here rebuild <code>tokens.css</code> for every project in the workspace.</p>
      </div>
    </div>

    <div class="ad-form" style="max-width: none;">
      <div class="ad-form__row">
        <div class="ad-field">
          <label class="ad-field__label" for="pattern-prefix">Custom property prefix</label>
          <input class="ad-input" id="pattern-prefix" type="text" value="ad" aria-describedby="pattern-prefix-hint">
          <p class="ad-field__hint" id="pattern-prefix-hint">Emitted as <code>--ad-*</code>.</p>
        </div>
        <div class="ad-field">
          <label class="ad-field__label" for="pattern-base">Base unit</label>
          <select class="ad-select" id="pattern-base">
            <option>2px</option>
            <option selected>4px</option>
            <option>8px</option>
          </select>
          <p class="ad-field__hint">Changing this rewrites the whole space ramp.</p>
        </div>
      </div>

      <div class="ad-field">
        <label class="ad-field__label" for="pattern-accent">Accent ramp</label>
        <input class="ad-input" id="pattern-accent" type="text" value="persimmon" aria-invalid="true" aria-describedby="pattern-accent-error">
        <p class="ad-field__error" id="pattern-accent-error">
          Ramp <code>persimmon</code> has no step that clears 4.5:1 on white below 700. Pick a step explicitly.
        </p>
      </div>

      <fieldset class="ad-fieldset">
        <legend>Emit</legend>
        <label class="ad-choice">
          <input type="checkbox" checked>
          <span class="ad-choice__text">CSS custom properties<span class="ad-choice__hint">One <code>:root</code> block plus both dark selectors.</span></span>
        </label>
        <label class="ad-choice">
          <input type="checkbox" checked>
          <span class="ad-choice__text">Reduced-motion overrides<span class="ad-choice__hint">Zeroes every duration token.</span></span>
        </label>
        <label class="ad-choice">
          <input type="checkbox">
          <span class="ad-choice__text">JSON<span class="ad-choice__hint">For tooling that cannot read CSS.</span></span>
        </label>
      </fieldset>

      <label class="ad-switch">
        <input type="checkbox" checked>
        <span class="ad-switch__track"></span>
        <span>Fail the build on a contrast regression</span>
      </label>

      <div class="ad-progress" style="max-width: none;">
        <div class="ad-progress__label">
          <span id="pattern-progress">Token coverage</span>
          <span class="ad-progress__value">{{ site.data.build.aliases }} / {{ site.data.build.aliases }} aliases documented</span>
        </div>
        <div class="ad-progress__track" role="progressbar" aria-labelledby="pattern-progress"
             aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">
          <div class="ad-progress__fill" style="width: 100%;"></div>
        </div>
      </div>
    </div>
  </div>

  <div class="ad-card__footer" style="justify-content: space-between; padding: var(--ad-space-4) var(--ad-space-6);">
    <span class="ad-badge ad-badge--caution"><span class="ad-badge__dot"></span>Unsaved changes</span>
    <span style="display: flex; gap: var(--ad-space-3);">
      <button type="button" class="ad-btn ad-btn--ghost">Discard</button>
      <button type="submit" class="ad-btn ad-btn--primary">Save and rebuild</button>
    </span>
  </div>
</form>
{% endexample %}

## What this screen is testing

- **Vertical rhythm across mixed control heights.** An input, a select, a
  fieldset of checkboxes, a switch, and a progress bar in one column, all spaced
  by `--ad-space-5` from the form and never by margins of their own.
- **The error state in a real form.** The invalid field sits between two valid
  ones. It has to be findable without being the loudest thing on screen.
- **A footer that carries both status and actions.** Status left, actions right,
  and the destructive-ish action (`Discard`) as a ghost so it does not compete.
- **Two tones at once.** A caution badge and an info callout coexist without the
  page turning into a traffic light, because both draw from the same restrained
  status tints.
- **The dark theme.** Nothing in this pattern has a colour of its own — every
  value is an alias, and the dark block repoints all of them at once.
