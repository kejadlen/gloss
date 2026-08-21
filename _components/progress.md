---
title: Progress
summary: >-
  A determinate bar for work that will finish, and a shuttle for work whose
  finish you cannot predict. Never a fake percentage.
---

## Determinate

{% example title="Progress" layout="stack" open %}
<div class="ad-progress" style="max-width: 24rem;">
  <div class="ad-progress__label">
    <span id="demo-progress-label">Compiling tokens</span>
    <span class="ad-progress__value">68%</span>
  </div>
  <div class="ad-progress__track" role="progressbar" aria-labelledby="demo-progress-label"
       aria-valuenow="68" aria-valuemin="0" aria-valuemax="100">
    <div class="ad-progress__fill" style="width: 68%;"></div>
  </div>
</div>
{% endexample %}

The `role="progressbar"` and its three `aria-value*` attributes go on the track,
not the fill. The fill is a decoration; the track is the control.

## Tones

{% example title="Tones" layout="stack" %}
<div class="ad-progress ad-progress--positive" style="max-width: 24rem;">
  <div class="ad-progress__label"><span id="p-1">Contrast checks</span><span class="ad-progress__value">10 / 10</span></div>
  <div class="ad-progress__track" role="progressbar" aria-labelledby="p-1" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">
    <div class="ad-progress__fill" style="width: 100%;"></div>
  </div>
</div>
<div class="ad-progress ad-progress--caution" style="max-width: 24rem;">
  <div class="ad-progress__label"><span id="p-2">Storage used</span><span class="ad-progress__value">81%</span></div>
  <div class="ad-progress__track" role="progressbar" aria-labelledby="p-2" aria-valuenow="81" aria-valuemin="0" aria-valuemax="100">
    <div class="ad-progress__fill" style="width: 81%;"></div>
  </div>
</div>
<div class="ad-progress ad-progress--critical" style="max-width: 24rem;">
  <div class="ad-progress__label"><span id="p-3">Budget remaining</span><span class="ad-progress__value">4%</span></div>
  <div class="ad-progress__track" role="progressbar" aria-labelledby="p-3" aria-valuenow="4" aria-valuemin="0" aria-valuemax="100">
    <div class="ad-progress__fill" style="width: 4%;"></div>
  </div>
</div>
{% endexample %}

Tone is about the meaning of the number, not the size of it. A bar at 100% is
positive when it is a task completing and critical when it is a quota filling.

## Indeterminate

{% example title="Indeterminate" layout="stack" %}
<div class="ad-progress ad-progress--indeterminate" style="max-width: 24rem;">
  <div class="ad-progress__label"><span id="p-4">Waiting for the build</span></div>
  <div class="ad-progress__track" role="progressbar" aria-labelledby="p-4">
    <div class="ad-progress__fill"></div>
  </div>
</div>
{% endexample %}

No `aria-valuenow` — its absence is what tells assistive technology the value is
unknown. Inventing a number here would be a lie told twice: once to the reader
and once to the screen reader.

Under `prefers-reduced-motion` the shuttle stops moving. The bar stays, the label
stays, and the reader still knows something is happening because the label says so.

## Rules

- **`role="progressbar"` on the track**, with `aria-labelledby` pointing at a
  visible label.
- **Omit `aria-valuenow` when you do not know it.** Do not pass `0`.
- **Show the number in text as well as in the bar.** A bar alone is unreadable
  at a glance and unusable in greyscale.
- **Under about two seconds, show nothing.** A progress bar that flashes is worse
  than no feedback at all.
