---
title: Field
summary: >-
  Label, control, hint, error. The wrapper owns the spacing so that a text input,
  a select, and a group of checkboxes all line up in the same form.
---

## Anatomy

Every field is a `<label>` (or a `<fieldset>` with a `<legend>`), a control, and
optionally a hint and an error. The wrapper is a flex column with
`--ad-space-2` between the parts, which is why controls of different heights
still produce an even form.

{% example title="A field with a hint" layout="stack" open %}
<div class="ad-field" style="max-width: 22rem;">
  <label class="ad-field__label" for="token-name">
    Token name <span class="ad-field__required" aria-hidden="true">*</span>
  </label>
  <input class="ad-input" id="token-name" name="token-name" type="text"
         placeholder="color-surface-sunken" aria-describedby="token-name-hint" required>
  <p class="ad-field__hint" id="token-name-hint">
    Lowercase, hyphenated, no prefix — the build adds <code>--ad-</code>.
  </p>
</div>
{% endexample %}

## Controls

{% example title="Text, textarea, select" layout="stack" %}
<div class="ad-form">
  <div class="ad-field">
    <label class="ad-field__label" for="demo-text">Display name</label>
    <input class="ad-input" id="demo-text" type="text" value="Persimmon">
  </div>
  <div class="ad-field">
    <label class="ad-field__label" for="demo-select">Ramp</label>
    <select class="ad-select" id="demo-select">
      <option>ink</option>
      <option selected>persimmon</option>
      <option>verdant</option>
      <option>amber</option>
    </select>
  </div>
  <div class="ad-field">
    <label class="ad-field__label" for="demo-textarea">Rationale</label>
    <textarea class="ad-textarea" id="demo-textarea"
              placeholder="Why this colour and not the one next to it?"></textarea>
    <p class="ad-field__hint">Optional, but the next person will thank you.</p>
  </div>
</div>
{% endexample %}

## Validation

Invalid state lives on the control via `aria-invalid`, not on the wrapper. That
way it works with native constraint validation and it is announced, not merely
coloured. The error message is wired up with `aria-describedby`.

{% example title="Invalid" layout="stack" %}
<div class="ad-field" style="max-width: 22rem;">
  <label class="ad-field__label" for="demo-invalid">Hex value</label>
  <input class="ad-input" id="demo-invalid" type="text" value="persimmon-ish"
         aria-invalid="true" aria-describedby="demo-invalid-error">
  <p class="ad-field__error" id="demo-invalid-error">
    Enter a six-digit hex, like <code>#ea360c</code>.
  </p>
</div>
{% endexample %}

## Disabled

{% example title="Disabled" layout="stack" %}
<div class="ad-form">
  <div class="ad-field">
    <label class="ad-field__label" for="demo-disabled">Inherited from the parent theme</label>
    <input class="ad-input" id="demo-disabled" type="text" value="--ad-color-canvas" disabled>
  </div>
  <label class="ad-choice">
    <input type="checkbox" disabled checked>
    <span class="ad-choice__text">Locked by the theme<span class="ad-choice__hint">Unlock the theme to edit this.</span></span>
  </label>
</div>
{% endexample %}

## Choices

Checkboxes and radios share `.ad-choice`, which puts the box on the first line
of a multi-line label instead of centring it against the whole block. Grouped
choices go in a `<fieldset>` so the group has a name.

{% example title="Checkbox and radio groups" layout="stack" %}
<fieldset class="ad-fieldset">
  <legend>Emit</legend>
  <label class="ad-choice">
    <input type="checkbox" checked>
    <span class="ad-choice__text">CSS custom properties<span class="ad-choice__hint">One <code>:root</code> block plus both dark selectors.</span></span>
  </label>
  <label class="ad-choice">
    <input type="checkbox">
    <span class="ad-choice__text">JSON<span class="ad-choice__hint">For tooling that cannot read CSS.</span></span>
  </label>
</fieldset>

<fieldset class="ad-fieldset">
  <legend>Default theme</legend>
  <label class="ad-choice"><input type="radio" name="demo-theme" checked> <span class="ad-choice__text">Follow the system</span></label>
  <label class="ad-choice"><input type="radio" name="demo-theme"> <span class="ad-choice__text">Always light</span></label>
  <label class="ad-choice"><input type="radio" name="demo-theme"> <span class="ad-choice__text">Always dark</span></label>
</fieldset>
{% endexample %}

## Switch

A switch takes effect immediately. A checkbox waits for a submit. If your switch
needs a Save button, it should have been a checkbox.

{% example title="Switch" layout="stack" %}
<label class="ad-switch">
  <input type="checkbox" checked>
  <span class="ad-switch__track"></span>
  <span>Rebuild tokens on save</span>
</label>
<label class="ad-switch">
  <input type="checkbox">
  <span class="ad-switch__track"></span>
  <span>Warn on contrast regressions</span>
</label>
<label class="ad-switch">
  <input type="checkbox" disabled>
  <span class="ad-switch__track"></span>
  <span class="ad-subtle">Publish to npm (not configured)</span>
</label>
{% endexample %}

## Rows

`.ad-form__row` is a `repeat(auto-fit, minmax(11rem, 1fr))` grid, so fields sit
side by side when there is room and stack when there is not. No breakpoint
needed.

{% example title="Two up" layout="stack" %}
<div class="ad-form" style="max-width: none;">
  <div class="ad-form__row">
    <div class="ad-field">
      <label class="ad-field__label" for="demo-from">Ramp</label>
      <input class="ad-input" id="demo-from" type="text" value="persimmon">
    </div>
    <div class="ad-field">
      <label class="ad-field__label" for="demo-to">Step</label>
      <input class="ad-input" id="demo-to" type="text" value="600">
    </div>
  </div>
</div>
{% endexample %}

## Rules

- **Every control has a real `<label>`.** A placeholder is not a label; it
  disappears the moment someone types.
- **Hints go in `aria-describedby`.** Otherwise a screen reader announces the
  label and nothing else.
- **Never mark a field invalid before the reader has finished with it.** Validate
  on blur or on submit.
- **The required marker is decorative.** `aria-hidden` on the asterisk, `required`
  on the input.
