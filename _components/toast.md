---
title: Toast
summary: >-
  A fixed bottom-right flash bar — the real pattern used for delete
  confirmations. Auto-dismisses after roughly 8 seconds in practice; wire
  that timer into the consuming app.
---

## Basic

The example below stays in document flow so it does not cover the page;
`.ad-toast--fixed` is what actually pins it bottom-right in a real app.

<% example(title: "Toast", open: true) do %>
<div class="ad-toast">
  <span class="ad-toast__message">Deleted "Call Mom"</span>
  <button type="button" class="ad-toast__action">Undo</button>
  <button type="button" class="ad-toast__dismiss" aria-label="Dismiss">×</button>
</div>
<% end %>

## Without an action

<% example(title: "No action") do %>
<div class="ad-toast">
  <span class="ad-toast__message">Series created</span>
  <button type="button" class="ad-toast__dismiss" aria-label="Dismiss">×</button>
</div>
<% end %>

## API

<div class="ad-table-wrap">
  <table class="ad-table ad-table--compact">
    <thead><tr><th scope="col">Prop</th><th scope="col">Type</th><th scope="col">Notes</th></tr></thead>
    <tbody>
      <tr><td class="ad-token-name">message</td><td class="ad-table__code">string</td><td>Required.</td></tr>
      <tr><td class="ad-token-name">actionLabel</td><td class="ad-table__code">string</td><td>Renders a destructive-coloured action, typically "Undo".</td></tr>
      <tr><td class="ad-token-name">onDismiss</td><td class="ad-table__code">function</td><td></td></tr>
    </tbody>
  </table>
</div>
