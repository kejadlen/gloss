---
layout: default
title: Overview
description: A small, documented design system rendered from YAML tokens by Jekyll on Ruby 4.0.
---

<div class="ad-hero">
  <p class="ad-overline">Design system</p>
  <h1 class="ad-hero__title">Every design system is a pile of arbitrary definitions. This one says so out loud.</h1>
  <p class="ad-lead">
    Somebody decided that the gap is 16px, that the accent is this orange and not that one,
    and that a warning is amber. None of it was inevitable. What makes it a system is that
    the decisions got written down in one place, given names, and then actually used.
  </p>
  <div class="ad-hero__actions">
    <a class="ad-btn ad-btn--primary ad-btn--lg" href="{{ '/foundations/color/' | relative_url }}">Start with colour</a>
    <a class="ad-btn ad-btn--secondary ad-btn--lg" href="{{ '/components/button/' | relative_url }}">Jump to components</a>
  </div>
</div>

<div class="ad-stat-row">
  <div class="ad-stat">
    <span class="ad-stat__value">{{ site.data.build.ramps }}</span>
    <span class="ad-stat__label">Colour ramps</span>
  </div>
  <div class="ad-stat">
    <span class="ad-stat__value">{{ site.data.build.aliases }}</span>
    <span class="ad-stat__label">Semantic aliases</span>
  </div>
  <div class="ad-stat">
    <span class="ad-stat__value">{{ site.components | size }}</span>
    <span class="ad-stat__label">Components</span>
  </div>
  <div class="ad-stat">
    <span class="ad-stat__value">{{ site.data.build.ruby }}</span>
    <span class="ad-stat__label">Ruby</span>
  </div>
</div>

## How it is put together

Three YAML files under `_data/tokens/` hold every value in the system. A Jekyll
generator written in Ruby reads them at build time and emits
`assets/css/tokens.css` — one flat block of custom properties, plus the dark
theme and a `prefers-reduced-motion` override. The component stylesheets read
`var(--ad-*)` and nothing else.

The same YAML feeds the tables and swatches on these pages, so the documentation
cannot drift from the stylesheet. If a hex changes in the YAML, the swatch, the
contrast figure, and the button all change together or none of them do.

<div class="ad-card-grid">
  <article class="ad-card ad-card--link">
    <div class="ad-card__body">
      <h3 class="ad-card__title"><a href="{{ '/foundations/color/' | relative_url }}">Foundations</a></h3>
      <p class="ad-card__text">
        Colour, type, space, elevation, and motion — with contrast ratios computed
        from the tokens during the build rather than typed in by hand.
      </p>
    </div>
  </article>
  <article class="ad-card ad-card--link">
    <div class="ad-card__body">
      <h3 class="ad-card__title"><a href="{{ '/components/button/' | relative_url }}">Components</a></h3>
      <p class="ad-card__text">
        Eight components, each rendered live next to the exact markup that produced
        it. The demo and the snippet are the same string.
      </p>
    </div>
  </article>
  <article class="ad-card ad-card--link">
    <div class="ad-card__body">
      <h3 class="ad-card__title"><a href="{{ '/rationale/' | relative_url }}">Why arbitrary</a></h3>
      <p class="ad-card__text">
        The argument for naming a decision you cannot justify, and the four rules
        this system actually enforces.
      </p>
    </div>
  </article>
</div>

## A taste of it

{% example title="Everything on one card" layout="stack" %}
<article class="ad-card ad-card--raised" style="max-width: 26rem;">
  <div class="ad-card__body">
    <div class="ad-badge-set">
      <span class="ad-badge ad-badge--accent">Draft</span>
      <span class="ad-badge"><span class="ad-badge__dot"></span>Unassigned</span>
    </div>
    <h3 class="ad-card__title">Rename the caution colour</h3>
    <p class="ad-card__text">
      Three people have called it “yellow” in review this month. The token is
      <code>--ad-color-caution</code>; the ramp is amber.
    </p>
  </div>
  <div class="ad-card__footer">
    <button type="button" class="ad-btn ad-btn--primary ad-btn--sm">Approve</button>
    <button type="button" class="ad-btn ad-btn--ghost ad-btn--sm">Dismiss</button>
  </div>
</article>
{% endexample %}

## Using it elsewhere

Everything the system needs is two stylesheets and no JavaScript. Copy them into
any project and the class names work as documented.

```html
<link rel="stylesheet" href="tokens.css">
<link rel="stylesheet" href="style.css">
```

See [Using the CSS]({{ '/install/' | relative_url }}) for the details, including
how to retheme the whole thing by overriding a dozen custom properties.
