---
title: Colour
summary: >-
  Six ramps and thirty-two semantic aliases. Components never touch a ramp
  directly, which is the only reason the dark theme is one file and not a rewrite.
---

## The two layers

The system separates *what a colour is* from *what a colour is for*.

The **ramps** below are raw material: twelve steps of ink, eleven of persimmon,
and four supporting hues. They exist so that the next decision has something to
choose from. No component references them.

The **aliases** underneath are the working vocabulary — `--ad-color-text`,
`--ad-color-critical-subtle`, `--ad-color-focus`. Every rule in every component
stylesheet reads from these. Swapping a theme means repointing aliases at
different ramp steps, which is exactly what the dark theme does.

<div class="ad-callout ad-callout--neutral">
  <div class="ad-callout__body">
    <p class="ad-callout__title">Contrast figures on this page are computed, not typed</p>
    <p style="margin:0">
      Each ratio comes from <code>lib/arbitrary_definitions/color_math.rb</code>, run
      against the token value during the Jekyll build. A hex cannot change without its
      contrast number changing with it.
    </p>
  </div>
</div>

## Ramps

{% for ramp in site.data.tokens.color.ramps %}
### {{ ramp.label }}

<p class="ad-muted">{{ ramp.description }}</p>

<ul class="ad-swatch-grid">
  {%- for step in ramp.steps %}
  {%- assign on = step.value | readable_on %}
  <li class="ad-swatch">
    <div class="ad-swatch__chip" style="background: {{ step.value }}; color: {{ on }};">{{ ramp.name }}&nbsp;{{ step.step }}</div>
    <div class="ad-swatch__meta">
      <span class="ad-swatch__hex">{{ step.value }}</span>
      <span class="ad-swatch__ratio">{{ step.value | contrast_with: '#ffffff' }} on white</span>
    </div>
  </li>
  {%- endfor %}
</ul>
{% endfor %}

## Semantic aliases

Both themes, side by side. The left half of each chip is the light value and the
right half is the dark one — a token whose halves look identical across a whole
group usually means somebody forgot to think about dark mode.

{% assign groups = site.data.tokens.semantic.groups %}
{% for group in groups %}
### {{ group.name }}

<p class="ad-muted">{{ group.description }}</p>

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
      {%- for token in group.tokens %}
      {%- assign flat = site.data.semantic_flat | where: "token", token.token | first %}
      <tr>
        <td>
          <div class="ad-alias-row">
            <span class="ad-alias-chip ad-alias-chip--pair" aria-hidden="true">
              <span style="background: {{ flat.light }}"></span>
              <span style="background: {{ flat.dark }}"></span>
            </span>
            <span class="ad-token-name">{{ flat.name }}</span>
          </div>
        </td>
        <td class="ad-table__code">{{ token.light }}<br><span class="ad-subtle">{{ flat.light }}</span></td>
        <td class="ad-table__code">{{ token.dark }}<br><span class="ad-subtle">{{ flat.dark }}</span></td>
        <td>{{ token.usage }}</td>
      </tr>
      {%- endfor %}
    </tbody>
  </table>
</div>
{% endfor %}

## Contrast that has to hold

Three pairings are load-bearing. The build fails if any of them drops below WCAG
AA — `test/test_token_set.rb` asserts it on the light and dark themes both.

{% assign text = site.data.semantic_flat | where: "token", "color-text" | first %}
{% assign muted = site.data.semantic_flat | where: "token", "color-text-muted" | first %}
{% assign canvas = site.data.semantic_flat | where: "token", "color-canvas" | first %}
{% assign accent = site.data.semantic_flat | where: "token", "color-accent" | first %}
{% assign on_accent = site.data.semantic_flat | where: "token", "color-on-accent" | first %}

<div class="ad-table-wrap">
  <table class="ad-table">
    <caption>Ratios computed at build time from the token values themselves.</caption>
    <thead>
      <tr>
        <th scope="col">Pair</th>
        <th scope="col">Theme</th>
        <th scope="col" class="ad-table__num">Ratio</th>
        <th scope="col">Grade</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>Body text on canvas</td>
        <td>Light</td>
        <td class="ad-table__num">{{ text.light | contrast_with: canvas.light }}</td>
        {%- assign grade = text.light | contrast_grade: canvas.light %}
        <td><span class="ad-grade ad-grade--{{ grade | replace: ' ', '-' }}">{{ grade }}</span></td>
      </tr>
      <tr>
        <td>Body text on canvas</td>
        <td>Dark</td>
        <td class="ad-table__num">{{ text.dark | contrast_with: canvas.dark }}</td>
        {%- assign grade = text.dark | contrast_grade: canvas.dark %}
        <td><span class="ad-grade ad-grade--{{ grade | replace: ' ', '-' }}">{{ grade }}</span></td>
      </tr>
      <tr>
        <td>Muted text on canvas</td>
        <td>Light</td>
        <td class="ad-table__num">{{ muted.light | contrast_with: canvas.light }}</td>
        {%- assign grade = muted.light | contrast_grade: canvas.light %}
        <td><span class="ad-grade ad-grade--{{ grade | replace: ' ', '-' }}">{{ grade }}</span></td>
      </tr>
      <tr>
        <td>Muted text on canvas</td>
        <td>Dark</td>
        <td class="ad-table__num">{{ muted.dark | contrast_with: canvas.dark }}</td>
        {%- assign grade = muted.dark | contrast_grade: canvas.dark %}
        <td><span class="ad-grade ad-grade--{{ grade | replace: ' ', '-' }}">{{ grade }}</span></td>
      </tr>
      <tr>
        <td>Label on a filled accent</td>
        <td>Light</td>
        <td class="ad-table__num">{{ on_accent.light | contrast_with: accent.light }}</td>
        {%- assign grade = on_accent.light | contrast_grade: accent.light %}
        <td><span class="ad-grade ad-grade--{{ grade | replace: ' ', '-' }}">{{ grade }}</span></td>
      </tr>
      <tr>
        <td>Label on a filled accent</td>
        <td>Dark</td>
        <td class="ad-table__num">{{ on_accent.dark | contrast_with: accent.dark }}</td>
        {%- assign grade = on_accent.dark | contrast_grade: accent.dark %}
        <td><span class="ad-grade ad-grade--{{ grade | replace: ' ', '-' }}">{{ grade }}</span></td>
      </tr>
    </tbody>
  </table>
</div>

<div class="ad-callout ad-callout--caution">
  <div class="ad-callout__body">
    <p class="ad-callout__title">Where the system knowingly stops short</p>
    <p style="margin:0">
      <code>--ad-color-border</code> sits around 1.3:1 against the surfaces it divides.
      That is well under the 3:1 that WCAG 1.4.11 asks of a boundary a user has to
      find. It is deliberate — a table gridded in 3:1 lines is unreadable — but it
      means the default border is decorative. Any edge that is the <em>only</em> way
      to locate a control uses <code>--ad-color-border-strong</code>, which is tested
      at 3:1 in both themes.
    </p>
  </div>
</div>

## Rules

- **Never write a hex outside `_data/tokens/color.yml`.** If a component needs a
  colour that does not exist yet, the colour does not exist yet. Add the alias.
- **Status colour is never the only signal.** Every status component carries an
  icon, a label, or a dot alongside the hue.
- **One focus colour.** `--ad-color-focus` is azure everywhere, including on
  persimmon surfaces, because a focus ring that changes per component is a focus
  ring nobody learns.
