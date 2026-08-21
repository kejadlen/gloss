---
title: Motion
summary: >-
  Four durations, four easings, and one rule that overrides all of them: if the
  reader asked for less motion, they get none.
---

## Durations

Interface motion is short. Anything over a third of a second stops feeling like
a response and starts feeling like a wait.

<div class="ad-table-wrap">
  <table class="ad-table ad-table--compact">
    <thead><tr><th scope="col">Token</th><th scope="col">Value</th><th scope="col">Use for</th></tr></thead>
    <tbody>
      {%- for row in site.data.tokens.scale.motion.durations %}
      <tr>
        <td class="ad-token-name">{{ row.token | custom_property }}</td>
        <td class="ad-table__code">{{ row.value }}</td>
        <td>{{ row.usage }}</td>
      </tr>
      {%- endfor %}
    </tbody>
  </table>
</div>

## Easings

Hover or focus a tile to run its curve. All four move the same distance over the
same 320ms, so the only difference you are seeing is the shape.

<ul class="ad-motion-grid">
  {%- for row in site.data.tokens.scale.motion.easings %}
  <li>
    <div class="ad-motion-demo" tabindex="0"
         style="--_easing: {{ row.value }}; --_duration: var(--ad-duration-slow);">
      <span class="ad-motion-demo__dot"></span>
    </div>
    <div class="ad-specimen__meta"><span class="ad-token-name">{{ row.token }}</span></div>
    <p class="ad-muted" style="font-size: var(--ad-text-xs); margin: var(--ad-space-1) 0 0;">{{ row.usage }}</p>
  </li>
  {%- endfor %}
</ul>

## Reduced motion is not a downgrade

`_plugins/token_generator.rb` emits a `prefers-reduced-motion: reduce` block that
sets every duration token to `0ms`, and the base stylesheet clamps any remaining
transition or animation to a hundredth of a millisecond. Components do not have
to opt in, and cannot opt out.

```css
@media (prefers-reduced-motion: reduce) {
  :root {
    --ad-duration-instant: 0ms;
    --ad-duration-fast: 0ms;
    --ad-duration-base: 0ms;
    --ad-duration-slow: 0ms;
  }
}
```

The state change still happens. The switch still moves. It simply arrives
instead of travelling.

{% example title="The one component allowed to overshoot" %}
<label class="ad-switch">
  <input type="checkbox" checked>
  <span class="ad-switch__track"></span>
  <span>Ship on merge</span>
</label>
<label class="ad-switch">
  <input type="checkbox">
  <span class="ad-switch__track"></span>
  <span>Notify the channel</span>
</label>
{% endexample %}

## Rules

- **Transition named properties, never `all`.** `transition: all` animates
  things you did not think about, including layout.
- **Prefer `opacity` and `transform`.** They are the two properties the
  compositor can animate without a layout pass.
- **Exit faster than you enter.** `--ad-ease-exit` is steeper than
  `--ad-ease-entrance` for exactly this reason.
- **`--ad-ease-spring` is for toggles only.** Overshoot on a panel or a dialog
  reads as a bug.
