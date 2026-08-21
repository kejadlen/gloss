---
title: CardRow
summary: >-
  A hairline-divided list row for use inside Card — entry lists, task lists,
  settings rows. The first row's top border removes itself automatically.
---

## Basic

<% example(title: "Rows", open: true) do %>
<div class="ad-card" style="max-width: 22rem;">
  <div class="ad-card-row">Renew passport</div>
  <div class="ad-card-row">Dentist checkup</div>
  <div class="ad-card-row">Rotate mattress</div>
</div>
<% end %>

## Clickable

`--clickable` adds a hover fill and a pointer cursor. Use a real `<button>`
element when the row navigates or opens something.

<% example(title: "Clickable rows") do %>
<div class="ad-card" style="max-width: 22rem;">
  <button type="button" class="ad-card-row ad-card-row--clickable">Tax return 2025.pdf</button>
  <button type="button" class="ad-card-row ad-card-row--clickable">Warranty card.pdf</button>
</div>
<% end %>

## With content on both ends

The row is a flex container — a leading icon, a two-line middle column, and a
trailing mono value is the most common shape (see the Loop and Archive
patterns for it in context).

<% example(title: "Leading icon, trailing meta") do %>
<div class="ad-card" style="max-width: 24rem;">
  <div class="ad-card-row">
    <span class="ad-avatar ad-avatar--square">
      <svg width="17" height="17" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M21 8 12 3 3 8v8l9 5 9-5V8Z"/><path d="M3 8l9 5 9-5M12 13v8"/></svg>
    </span>
    <div style="flex:1; min-width:0;">
      <div style="font-weight: 550;">Dishwasher manual</div>
      <div class="type-label" style="margin-top: 2px;">PDF · 2.1MB</div>
    </div>
    <span class="type-mono" style="color: var(--ad-color-text-tertiary);">2h</span>
  </div>
</div>
<% end %>

## API

<div class="ad-table-wrap">
  <table class="ad-table ad-table--compact">
    <thead><tr><th scope="col">Prop</th><th scope="col">Type</th><th scope="col">Notes</th></tr></thead>
    <tbody>
      <tr><td class="ad-token-name">onClick</td><td class="ad-table__code">function</td><td>Reach for <code>.ad-card-row--clickable</code> and a <code>&lt;button&gt;</code>.</td></tr>
    </tbody>
  </table>
</div>
