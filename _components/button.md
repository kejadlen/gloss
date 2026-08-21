---
title: Button
summary: >-
  A flat, quiet button that recedes rather than performs — no gradients, no
  shine. Five variants, three sizes, one geometry.
---

## Variants

`default` is bordered and neutral. `primary` is the accent fill — one
committing action per view, at most. `dark` is reserved for the single most
committing action in a screen, typically a final Save; it should be rare.
`ghost` has no border or fill, for dismissals and tertiary actions. `danger`
is destructive and irreversible only.

<% example(title: "Variants", open: true) do %>
<button type="button" class="ad-btn">Cancel</button>
<button type="button" class="ad-btn ad-btn--primary">Save</button>
<button type="button" class="ad-btn ad-btn--dark">Finish setup</button>
<button type="button" class="ad-btn ad-btn--ghost">Dismiss</button>
<button type="button" class="ad-btn ad-btn--danger">Delete</button>
<% end %>

## Sizes

Sizes adjust padding only — the font stays on the type scale, it does not
grow a step of its own.

<% example(title: "Sizes") do %>
<button type="button" class="ad-btn ad-btn--primary ad-btn--sm">Small</button>
<button type="button" class="ad-btn ad-btn--primary">Medium</button>
<button type="button" class="ad-btn ad-btn--primary ad-btn--lg">Large</button>
<% end %>

## States

Disabled buttons drop to 50% opacity and keep their variant colours, so a
disabled primary still reads as the primary.

<% example(title: "States") do %>
<button type="button" class="ad-btn ad-btn--primary" disabled>Disabled</button>
<button type="button" class="ad-btn" aria-disabled="true">Not yet available</button>
<% end %>

<div class="ad-callout">
  <p class="type-label" style="margin-bottom: var(--ad-space-2xs); display:block;">disabled vs. aria-disabled</p>
  <p style="margin:0; font-size: var(--ad-step--1);">
    A <code>disabled</code> button is removed from the tab order, so a reader
    navigating by keyboard never learns it is there. When a button is
    temporarily unavailable and the reason matters, use
    <code>aria-disabled="true"</code> instead — it stays focusable and can
    carry an explanation.
  </p>
</div>

## With an icon

Pass an icon as the first child. The gap is `--ad-space-2xs`, set by the
button itself.

<% example(title: "Icon") do %>
<button type="button" class="ad-btn ad-btn--primary">
  <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.9" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M12 5v14M5 12h14"/></svg>
  New
</button>
<% end %>

## Groups

<% example(title: "Button group") do %>
<div class="ad-btn-group" role="group" aria-label="View">
  <button type="button" class="ad-btn ad-btn--sm">List</button>
  <button type="button" class="ad-btn ad-btn--sm">Board</button>
  <button type="button" class="ad-btn ad-btn--sm">Calendar</button>
</div>
<% end %>

## Full width

<% example(title: "Block", layout: "stack") do %>
<button type="button" class="ad-btn ad-btn--primary ad-btn--block">Take a photo</button>
<% end %>

## Links that act like buttons

An `<a>` with `.ad-btn` is fine when the thing it does is navigate. A
`<button>` is required when it changes something.

<% example(title: "Anchor as button") do %>
<a class="ad-btn ad-btn--primary" href="<%= relative_url('/components/icon-button/') %>">Next: IconButton</a>
<a class="ad-btn ad-btn--ghost" href="<%= relative_url('/foundations/color/') %>">Back to colour</a>
<% end %>

## API

<div class="ad-table-wrap">
  <table class="ad-table ad-table--compact">
    <thead><tr><th scope="col">Prop</th><th scope="col">Type</th><th scope="col">Notes</th></tr></thead>
    <tbody>
      <tr><td class="ad-token-name">variant</td><td class="ad-table__code">default | primary | dark | ghost | danger</td><td>Default <code>default</code>.</td></tr>
      <tr><td class="ad-token-name">size</td><td class="ad-table__code">sm | md | lg</td><td>Padding only.</td></tr>
      <tr><td class="ad-token-name">icon</td><td class="ad-table__code">node</td><td>Rendered before the label.</td></tr>
      <tr><td class="ad-token-name">disabled</td><td class="ad-table__code">boolean</td><td>Removes the button from the tab order.</td></tr>
    </tbody>
  </table>
</div>

<div class="ad-table-wrap">
  <table class="ad-table ad-table--compact">
    <thead><tr><th scope="col">Class</th><th scope="col">Effect</th></tr></thead>
    <tbody>
      <tr><td class="ad-token-name">.ad-btn</td><td>Required base. Sets geometry, focus, and transitions.</td></tr>
      <tr><td class="ad-token-name">.ad-btn--primary / --dark / --ghost / --danger</td><td>Variant fills.</td></tr>
      <tr><td class="ad-token-name">.ad-btn--sm / --lg</td><td>Height, padding, and font size in one step.</td></tr>
      <tr><td class="ad-token-name">.ad-btn--block</td><td>Full width of its container.</td></tr>
    </tbody>
  </table>
</div>
