---
title: Tag
summary: >-
  A removable mono chip for freeform tags — locations, categories. `--dashed`
  renders an "add tag" affordance instead of a value.
---

## Default and removable

<% example(title: "Tags", open: true) do %>
<span class="ad-tag">location:garage</span>
<span class="ad-tag">category:appliance</span>
<span class="ad-tag">
  category:receipt
  <button type="button" class="ad-tag__remove" aria-label="Remove tag">×</button>
</span>
<% end %>

## Dashed — the "add tag" affordance

<% example(title: "Add tag") do %>
<div class="ad-tag-set">
  <span class="ad-tag">location:garage</span>
  <span class="ad-tag ad-tag--dashed">+ add tag</span>
</div>
<% end %>

## API

<div class="ad-table-wrap">
  <table class="ad-table ad-table--compact">
    <thead><tr><th scope="col">Prop</th><th scope="col">Type</th><th scope="col">Notes</th></tr></thead>
    <tbody>
      <tr><td class="ad-token-name">onRemove</td><td class="ad-table__code">function</td><td>Renders the × button when present.</td></tr>
      <tr><td class="ad-token-name">dashed</td><td class="ad-table__code">boolean</td><td>Renders an "add tag" affordance instead of a value.</td></tr>
    </tbody>
  </table>
</div>
