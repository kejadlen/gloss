---
layout: default
title: Overview
description: >-
  A personal design system for self-hosted, single-user tools — synthesized
  from three real running projects and rendered by a small Ruby/ERB
  static-site generator on Ruby 4.0.
---

<div class="ad-hero">
  <p class="ad-overline">Design system</p>
  <h1 class="ad-hero__title">A personal umbrella for side projects, given a shared visual spine.</h1>
  <p class="ad-lead">
    Arbitrary Definitions is not a company's design system — it is one person's,
    synthesized by reading three real, running personal projects rather than
    written from a spec. Each project keeps its own accent color and
    typographic mood; this system is what they all share underneath.
  </p>
  <div class="ad-hero__actions">
    <a class="ad-btn ad-btn--primary ad-btn--lg" href="<%= relative_url('/foundations/color/') %>">Start with color</a>
    <a class="ad-btn ad-btn--lg" href="<%= relative_url('/components/button/') %>">Jump to components</a>
  </div>
</div>

<div class="ad-stat-row">
  <div class="ad-stat">
    <span class="ad-stat__value">3</span>
    <span class="ad-stat__label">Color ramps</span>
  </div>
  <div class="ad-stat">
    <span class="ad-stat__value">17</span>
    <span class="ad-stat__label">Semantic aliases</span>
  </div>
  <div class="ad-stat">
    <span class="ad-stat__value">16</span>
    <span class="ad-stat__label">Components</span>
  </div>
  <div class="ad-stat">
    <span class="ad-stat__value">3</span>
    <span class="ad-stat__label">Source projects</span>
  </div>
</div>

## Where it came from

Synthesized by reading three real projects, not copied from any one of them:
[domus](https://github.com/kejadlen/domus) (a household inventory and
document archive — warm paper surfaces, a swappable "Clay" accent, a
capture dock), [ketchup](https://github.com/kejadlen/ketchup) (a
recurring-task tracker — all-mono, plain grays, a flash-bar toast), and
[quire](https://github.com/kejadlen/quire) (a personal git forge — humanist
sans and mono, a full dark palette, underline tabs). The one literal constant
across all three is an identical Utopia fluid type/space scale — adopted
verbatim as this system's spine. Everything else is a synthesized middle
ground. See [Why arbitrary](<%= relative_url('/rationale/') %>) for the full
story, including where this system knowingly guesses.

## How it is put together

`assets/css/tokens.css` is one hand-maintained, hand-readable file of CSS
custom properties — the palette ramps, the semantic aliases, the dark theme,
and a `prefers-reduced-motion` override. The component stylesheets read
`var(--ad-*)` and nothing else.

The tables and swatches on these pages are static too — transcribed once
from the token values, not recomputed on every build. If a hex changes in
`tokens.css`, the swatch and the button are updated by hand together, the
same afternoon.

<div class="ad-card-grid">
  <article class="ad-card ad-card--link">
    <div class="ad-card__body">
      <h3 class="ad-card__title"><a href="<%= relative_url('/foundations/color/') %>">Foundations</a></h3>
      <p class="ad-card__text">
        Color, type, space, elevation, and motion — with contrast ratios
        computed from the tokens and checked by hand, not typed by guess.
      </p>
    </div>
  </article>
  <article class="ad-card ad-card--link">
    <div class="ad-card__body">
      <h3 class="ad-card__title"><a href="<%= relative_url('/components/button/') %>">Components</a></h3>
      <p class="ad-card__text">
        Sixteen components across core, forms, feedback, and navigation, each
        rendered live next to the exact markup that produced it.
      </p>
    </div>
  </article>
  <article class="ad-card ad-card--link">
    <div class="ad-card__body">
      <h3 class="ad-card__title"><a href="<%= relative_url('/patterns/loop/') %>">Patterns</a></h3>
      <p class="ad-card__text">
        Loop and Archive — a task dashboard and a capture app — put every
        component family in one screen at once.
      </p>
    </div>
  </article>
</div>

## A taste of it

<figure class="example">
<figcaption>Everything on one card</figcaption>
<div data-layout="stack">
<article class="ad-card ad-card--elevated" style="max-width: 26rem;">
  <div class="ad-card__body">
    <div class="ad-badge-set">
      <span class="ad-badge ad-badge--accent">Recommended</span>
      <span class="ad-badge">Unassigned</span>
    </div>
    <h3 class="ad-card__title">Rename the caution color</h3>
    <p class="ad-card__text">
      Three people have called it "yellow" in review this month. There is no
      caution token in this system — only <code>--ad-color-success</code> and
      <code>--ad-color-danger</code>, fixed across every project.
    </p>
  </div>
  <div class="ad-card__footer">
    <button type="button" class="ad-btn ad-btn--primary ad-btn--sm">Approve</button>
    <button type="button" class="ad-btn ad-btn--ghost ad-btn--sm">Dismiss</button>
  </div>
</article>
</div>
<details><summary>Markup</summary>
<pre><code>&lt;article class=&quot;ad-card ad-card--elevated&quot; style=&quot;max-width: 26rem;&quot;&gt;
  &lt;div class=&quot;ad-card__body&quot;&gt;
    &lt;div class=&quot;ad-badge-set&quot;&gt;
      &lt;span class=&quot;ad-badge ad-badge--accent&quot;&gt;Recommended&lt;/span&gt;
      &lt;span class=&quot;ad-badge&quot;&gt;Unassigned&lt;/span&gt;
    &lt;/div&gt;
    &lt;h3 class=&quot;ad-card__title&quot;&gt;Rename the caution color&lt;/h3&gt;
    &lt;p class=&quot;ad-card__text&quot;&gt;
      Three people have called it &quot;yellow&quot; in review this month. There is no
      caution token in this system — only &lt;code&gt;--ad-color-success&lt;/code&gt; and
      &lt;code&gt;--ad-color-danger&lt;/code&gt;, fixed across every project.
    &lt;/p&gt;
  &lt;/div&gt;
  &lt;div class=&quot;ad-card__footer&quot;&gt;
    &lt;button type=&quot;button&quot; class=&quot;ad-btn ad-btn--primary ad-btn--sm&quot;&gt;Approve&lt;/button&gt;
    &lt;button type=&quot;button&quot; class=&quot;ad-btn ad-btn--ghost ad-btn--sm&quot;&gt;Dismiss&lt;/button&gt;
  &lt;/div&gt;
&lt;/article&gt;</code></pre>
</details>
</figure>

## Voice

Plain, unhurried, never marketing copy. "Take a photo or pick a file to
keep." — not "Effortlessly supercharge your workflow!" These are tools for
one person or household; copy never addresses "you" as a customer, and an
empty state just states the fact: "Nothing tracked yet."

## Using it elsewhere

Everything the system needs is two stylesheets and, for most components, no
JavaScript at all.

```html
<link rel="stylesheet" href="tokens.css">
<link rel="stylesheet" href="style.css">
```

See [Using the CSS](<%= relative_url('/install/') %>) for the details,
including how to retheme the whole thing by overriding a dozen custom
properties.
