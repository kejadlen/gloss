---
title: Motion
summary: >-
  Two durations, one easing curve, and one rule that overrides both: if the
  reader asked for less motion, they get none. This is an interface, not a
  title sequence.
---

## Durations

Short ease transitions on hover and focus only — no bounce, no springy
easing, no page-transition choreography.

<div class="ad-table-wrap">
  <table class="ad-table ad-table--compact">
    <thead><tr><th scope="col">Token</th><th scope="col">Value</th><th scope="col">Use for</th></tr></thead>
    <tbody>
      <% site.data.tokens.scale.motion.durations.each do |row| -%>
      <tr>
        <td class="ad-token-name"><%= custom_property(row.token) %></td>
        <td class="ad-table__code"><%= row.value %></td>
        <td><%= row.usage %></td>
      </tr>
      <% end -%>
    </tbody>
  </table>
</div>

## One easing

There is exactly one curve in the system. Hover the tile below to run it.

<ul class="ad-motion-grid">
  <% site.data.tokens.scale.motion.easings.each do |row| -%>
  <li>
    <div class="ad-motion-demo" tabindex="0">
      <span class="ad-motion-demo__dot"></span>
    </div>
    <div class="ad-specimen__meta"><span class="ad-token-name"><%= custom_property(row.token) %></span></div>
    <p class="ad-muted" style="font-size: var(--ad-step--2); margin: var(--ad-space-3xs) 0 0;"><%= row.usage %></p>
  </li>
  <% end -%>
</ul>

## Reduced motion is not a downgrade

`_plugins/token_generator.rb` emits a `prefers-reduced-motion: reduce` block
that sets every duration token to `0ms`, and the base stylesheet clamps any
remaining transition or animation to a hundredth of a millisecond. Components
do not have to opt in, and cannot opt out.

```css
@media (prefers-reduced-motion: reduce) {
  :root {
    --ad-dur-fast: 0ms;
    --ad-dur-base: 0ms;
  }
}
```

The state change still happens. The Switch still moves. It simply arrives
instead of travelling.

<% example(title: "Motion in practice") do %>
<label class="ad-switch">
  <input type="checkbox" checked>
  <span class="ad-switch__track"></span>
  <span>Dark mode</span>
</label>
<label class="ad-switch">
  <input type="checkbox">
  <span class="ad-switch__track"></span>
  <span>Weekly digest</span>
</label>
<% end %>

## Rules

- **Transition named properties, never `all`.** `transition: all` animates
  things you did not think about, including layout.
- **Hover states shift a background one step deeper, never a colour or
  opacity trick.** Surface → fill is the whole vocabulary.
- **Press is not animated.** Rely on the hover-darken plus native `:active`,
  if anything at all.
- **Motion is for hover and focus only.** No page-transition choreography.
