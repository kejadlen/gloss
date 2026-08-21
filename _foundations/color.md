---
title: Colour
summary: >-
  Two neutral ramps, five accents, two fixed semantic colours, seventeen
  semantic aliases. Low-chroma warm-gray, never stark white or black.
---

## The two layers

The system separates *what a colour is* from *what a colour is for*.

The **ramps** below are raw material: ten steps of neutral (light), the same
ten inverted for dark mode, and five accent hues. No component references
them directly.

The **aliases** underneath are the working vocabulary — `--ad-color-text-primary`,
`--ad-color-surface-card`, `--ad-color-accent`. Every component stylesheet
reads from these. Retheming, or switching to dark, means repointing aliases
at different values — which is exactly what the dark block does.

<div class="ad-callout">
  <p style="margin:0; font-size: var(--ad-step--1);">
    The neutral ramps were authored in <code>oklch()</code> by the three
    projects this system was synthesized from (see
    <a href="<%= relative_url('/rationale/') %>">Why arbitrary</a>). This
    site's contrast-testing suite only understands flat hex, so every value
    below is that same colour converted to sRGB — not re-picked, not rounded.
    Contrast figures on this page are computed from those hex values during
    the build by <code>lib/arbitrary_definitions/color_math.rb</code>.
  </p>
</div>

## Neutral

Low-chroma warm-gray — the intersection of ketchup's plain grays, quire's
warm cream/dark palette, and domus's warm paper. Ten steps, not twelve or
sixteen: the source defines exactly these.

<% neutral = site.data.tokens.color.ramps.find { |r| r.name == "neutral" } -%>
<p class="ad-muted"><%= neutral.description %></p>
<ul class="ad-swatch-grid">
  <% neutral.steps.sort_by { |s| s.order }.each do |step| -%>
  <% on = readable_on(step.value) -%>
  <li class="ad-swatch">
    <div class="ad-swatch__chip" style="background: <%= step.value %>; color: <%= on %>;">n-<%= step.step %></div>
    <div class="ad-swatch__meta">
      <span class="ad-swatch__hex"><%= step.value %></span>
      <span class="ad-swatch__ratio"><%= contrast_with(step.value, '#ffffff') %> on white</span>
    </div>
  </li>
  <% end -%>
</ul>

<% neutral_dark = site.data.tokens.color.ramps.find { |r| r.name == "neutral_dark" } -%>
<p class="ad-muted"><%= neutral_dark.description %></p>
<ul class="ad-swatch-grid">
  <% neutral_dark.steps.sort_by { |s| s.order }.each do |step| -%>
  <% on = readable_on(step.value) -%>
  <li class="ad-swatch">
    <div class="ad-swatch__chip" style="background: <%= step.value %>; color: <%= on %>;">nd-<%= step.step %></div>
    <div class="ad-swatch__meta">
      <span class="ad-swatch__hex"><%= step.value %></span>
      <span class="ad-swatch__ratio"><%= contrast_with(step.value, '#000000') %> on black</span>
    </div>
  </li>
  <% end -%>
</ul>

## Accent

One swappable accent per project — never two in the same view. Signal Teal is
the default; the other four are the sanctioned menu a project can switch to.

<% accent = site.data.tokens.color.ramps.find { |r| r.name == "accent" } -%>
<ul class="ad-accent-grid">
  <% accent.steps.each do |step| -%>
  <li>
    <div class="ad-accent-demo" style="background: <%= step.value %>;"><%= step.step %><% if step.step == "teal" %> (default)<% end %></div>
    <div class="ad-specimen__meta"><span class="ad-token-name"><%= step.value %></span><span><%= contrast_with(step.value, '#ffffff') %>:1 on white</span></div>
    <p class="ad-muted" style="font-size: var(--ad-step--2); margin: var(--ad-space-3xs) 0 0;"><%= step.usage %></p>
  </li>
  <% end -%>
</ul>

<div class="ad-callout">
  <p style="margin:0; font-size: var(--ad-step--1);">
    All five clear AA (4.5:1) for white text at their own value, but Ochre is
    the tightest of the five at roughly 4.6:1 — closer to the floor than the
    others (Ink Blue and Plum both clear 8.5:1). That is a real property of a
    dry, papery ochre and is not being rounded away; a project choosing Ochre
    as its accent should re-check any place it sets small white text directly
    on the accent fill, rather than through <code>--ad-color-accent-fg</code>
    on a full-size Button.
  </p>
</div>

## Semantic aliases

Both themes, side by side. The left half of each chip is the light value and
the right half is the dark one.

<% site.data.tokens.semantic.groups.each do |group| -%>
### <%= group.name %>

<p class="ad-muted"><%= group.description %></p>

<div class="ad-table-wrap">
  <table class="ad-table ad-table--compact">
    <thead>
      <tr>
        <th scope="col">Token</th>
        <th scope="col">Light</th>
        <th scope="col">Dark</th>
        <th scope="col">Use for</th>
      </tr>
    </thead>
    <tbody>
      <% group.tokens.each do |token| -%>
      <% flat = site.data.semantic_flat.find { |f| f.token == token.token } -%>
      <tr>
        <td>
          <div class="ad-alias-row">
            <% if flat.light.include?("color-mix") -%>
            <span class="ad-alias-chip" aria-hidden="true" style="background: repeating-linear-gradient(45deg, var(--ad-color-surface-fill) 0 4px, var(--ad-color-surface-card) 4px 8px);"></span>
            <% else -%>
            <span class="ad-alias-chip ad-alias-chip--pair" aria-hidden="true">
              <span style="background: <%= flat.light %>"></span>
              <span style="background: <%= flat.dark %>"></span>
            </span>
            <% end -%>
            <span class="ad-token-name"><%= flat.name %></span>
          </div>
        </td>
        <td class="ad-table__code"><%= token.light %></td>
        <td class="ad-table__code"><%= token.dark %></td>
        <td><%= token.usage %></td>
      </tr>
      <% end -%>
    </tbody>
  </table>
</div>
<% end -%>

## Contrast that has to hold

Colour is the one part of this system that is not arbitrary: a ratio is a
fact about two colours and a pair of eyes, and it does not care what the
palette wants. The pairings below live in `_data/tokens/contrast.yml`,
`test/test_token_set.rb` asserts every one of them in both themes, and this
table is rendered from that same file.

<% contract = site.data.tokens.contrast -%>
<% flat = site.data.semantic_flat -%>

<% contract.each do |_key, spec| -%>
### <%= spec.label %> — <%= spec.minimum %>:1 minimum

<p class="ad-muted"><%= spec.standard %></p>

<div class="ad-table-wrap">
  <table class="ad-table ad-table--compact">
    <thead>
      <tr>
        <th scope="col">Pairing</th>
        <th scope="col">Where it shows up</th>
        <th scope="col" class="ad-table__num">Light</th>
        <th scope="col" class="ad-table__num">Dark</th>
      </tr>
    </thead>
    <tbody>
      <% spec.pairs.each do |pair| -%>
      <% fg = flat.find { |f| f.token == pair.foreground } -%>
      <% bg = flat.find { |f| f.token == pair.background } -%>
      <tr>
        <td>
          <span class="ad-alias-row">
            <span class="ad-alias-chip" aria-hidden="true"
                  style="background: <%= bg.light %>; color: <%= fg.light %>; display: grid; place-items: center; font-size: 10px;">Aa</span>
            <span class="ad-token-name"><%= pair.foreground %><br><span class="ad-subtle">on <%= pair.background %></span></span>
          </span>
        </td>
        <td><%= pair.note %></td>
        <% light_ratio = contrast_with(fg.light, bg.light) -%>
        <% dark_ratio = contrast_with(fg.dark, bg.dark) -%>
        <td class="ad-table__num"><%= light_ratio %></td>
        <td class="ad-table__num"><%= dark_ratio %></td>
      </tr>
      <% end -%>
    </tbody>
  </table>
</div>
<% end -%>

Every figure above was computed during this build from the token value
itself — none of it was typed by a person.

<div class="ad-callout">
  <p style="margin:0; font-size: var(--ad-step--1);">
    Two things this contract deliberately does not assert.
    <strong>Text tertiary</strong> — <code>--ad-color-text-tertiary</code>
    (neutral.500) is roughly 3.46:1 against the page in light mode, under the
    4.5:1 floor. The source documents that step as muted-faint text —
    placeholders and de-emphasised metadata, never body copy — so this is a
    real, intentional property of the palette, not a bug to patch by
    darkening the step.
    <strong>Borders</strong> — <code>--ad-color-border-hairline</code> and
    <code>--ad-color-border-default</code> sit well under the 3:1 that WCAG
    1.4.11 asks of a meaningful boundary. The source's own words are
    "hairline (1px) borders and dividers do most of the elevation work" —
    borders here are deliberately quiet, and the source never claims a 3:1
    bar for them, so this contract does not invent one.
  </p>
</div>

## Rules

- **Never write a hex outside `_data/tokens/color.yml`.** If a component
  needs a colour that does not exist yet, add the alias.
- **One accent per project, never two in a view.** Swapping `--ad-color-accent`
  re-derives `-ink` and `-soft` automatically via `color-mix()`.
- **`--ad-color-success` and `--ad-color-danger` are fixed.** They read the
  same in every project and are never swapped the way the accent is.
