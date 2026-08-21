---
title: Table
summary: >-
  Left-aligned by default, numeric columns opt into tabular figures, and the
  whole thing scrolls inside its own wrapper instead of pushing the page sideways.
---

## Default

{% example title="Table" layout="stack" open %}
<div class="ad-table-wrap">
  <table class="ad-table">
    <caption>Ramps and their step counts.</caption>
    <thead>
      <tr>
        <th scope="col">Ramp</th>
        <th scope="col">Role</th>
        <th scope="col" class="ad-table__num">Steps</th>
      </tr>
    </thead>
    <tbody>
      {%- for ramp in site.data.tokens.color.ramps %}
      <tr>
        <td class="ad-table__code">{{ ramp.name }}</td>
        <td>{{ ramp.description | truncate: 64 }}</td>
        <td class="ad-table__num">{{ ramp.steps | size }}</td>
      </tr>
      {%- endfor %}
    </tbody>
  </table>
</div>
{% endexample %}

That table is not hand-written. It loops over the same YAML the stylesheet is
compiled from, so adding a ramp adds a row.

## Density and emphasis

{% example title="Compact, striped, hoverable" layout="stack" %}
<div class="ad-table-wrap">
  <table class="ad-table ad-table--compact ad-table--striped ad-table--hover">
    <thead>
      <tr>
        <th scope="col">Token</th>
        <th scope="col" class="ad-table__num">Light</th>
        <th scope="col" class="ad-table__num">Dark</th>
      </tr>
    </thead>
    <tbody>
      {%- assign shown = site.data.tokens.scale.space.scale | slice: 1, 6 %}
      {%- for step in shown %}
      <tr>
        <td class="ad-table__code">{{ step.token }}</td>
        <td class="ad-table__num">{{ step.px }}px</td>
        <td class="ad-table__num">{{ step.px }}px</td>
      </tr>
      {%- endfor %}
    </tbody>
  </table>
</div>
{% endexample %}

Stripes and hover are alternatives, not partners. Stripes help the eye track a
long row across many columns; hover helps when rows are clickable. Together they
fight.

## Overflow

`.ad-table-wrap` owns `overflow-x: auto`, so a wide table scrolls inside its own
box and the page body never scrolls horizontally. This is the single most
common way a documentation site breaks on a phone.

## Rules

- **Every header cell gets `scope`.** `scope="col"` on column headers,
  `scope="row"` on the first cell of a row when it identifies the row.
- **Numbers right, text left, and `tabular-nums` on the numbers** so digits
  stack into columns.
- **A `<caption>` beats a heading above the table.** It is announced as part of
  the table.
- **Never nest a table in a table.** If the data is that shaped, it is two
  tables.
