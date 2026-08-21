---
title: Using the CSS
permalink: /install/
section: Start here
summary: >-
  Two stylesheets, almost no JavaScript, no build step. Then a dozen custom
  properties if you want it to stop looking like this site.
---

## The two files

The system compiles to exactly two stylesheets. `tokens.css` is a
hand-maintained block of custom properties; `style.css` is the components.
The order matters — the components read the custom properties the tokens
define.

```html
<link rel="stylesheet" href="tokens.css">
<link rel="stylesheet" href="style.css">
```

Both are on this site at
[`/assets/css/tokens.css`](<%= relative_url('/assets/css/tokens.css') %>) and
[`/assets/css/style.css`](<%= relative_url('/assets/css/style.css') %>).

Load IBM Plex Mono separately — it is the system's one webfont, and nothing
else is fetched:

```css
@import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Mono:wght@400;500;600&display=swap');
```

Almost nothing here needs JavaScript. `assets/js/system.js` adds keyboard
handling for [Tabs](<%= relative_url('/components/tabs/') %>) and the theme
toggle — Tooltip, Checkbox, Radio, and Switch are pure CSS, and Dialog/Toast
are shown as static states for documentation rather than wired up as
production widgets.

## Dark theme

The source's own convention is an opt-in `.theme-dark` class, applied
explicitly rather than inherited from the OS. This site instead keeps this
repository's own mechanism — a `data-theme="dark"` attribute plus
`prefers-color-scheme` — because the toggle UI on every page already depends
on it and the two are functionally equivalent: both repoint the same
semantic aliases at the inverted neutral ramp.

```css
:root { --ad-color-surface-page: #faf9f7; }

@media (prefers-color-scheme: dark) {
  :root:not([data-theme="light"]) { --ad-color-surface-page: #0e0d0b; }
}

:root[data-theme="dark"] { --ad-color-surface-page: #0e0d0b; }
```

To wire up your own toggle, set or clear `data-theme` on `<html>` and persist
the choice. Apply it in a blocking inline script in `<head>` or the page will
flash the wrong theme before your bundle runs.

## Retheming

Because every component reads an alias, retheming is a matter of repointing
a handful of custom properties after the token file loads — most of all,
`--ad-color-accent`, which `-ink` and `-soft` re-derive from automatically via
`color-mix()`.

```css
:root {
  --ad-color-accent: #9a5a3c; /* Clay */
}
```

<div class="ad-callout">
  <p style="margin:0; font-size: var(--ad-step--1);">
    Re-check contrast after retheming. The system's contrast guarantees on
    the <a href="<%= relative_url('/foundations/color/') %>">Color page</a>
    are about the system's own values — swap the accent and you own the
    result. The WCAG 2.1 relative-luminance formula is standard and easy to
    run against your own palette if you want the same numbers.
  </p>
</div>

## Building this site

There is no Jekyll here — the whole site is a Rakefile driving plain ERB
templates and Kramdown (see `lib/arbitrary_definitions/site_builder.rb`). It
still builds on GitHub Actions and uploads the result to Pages, mainly so the
build always runs on the pinned Ruby 4.0 rather than whatever GitHub's Pages
runner happens to ship. Locally:

```console
$ rbenv install 4.0.6      # or however you get Ruby 4.0
$ bundle install
$ bundle exec rake         # builds the site into _site/
$ bundle exec rake serve   # http://127.0.0.1:4000
```

## What is where

<div class="ad-table-wrap">
  <table class="ad-table ad-table--compact">
    <thead><tr><th scope="col">Path</th><th scope="col">What it is</th></tr></thead>
    <tbody>
      <tr><td class="ad-table__code">assets/css/tokens.css</td><td>Every value in the system, hand-maintained.</td></tr>
      <tr><td class="ad-table__code">_sass/</td><td>One plain CSS file per component group, concatenated into <code>style.css</code> at build time. No hexes, no pixels, no durations.</td></tr>
      <tr><td class="ad-table__code">lib/arbitrary_definitions/</td><td>The whole site builder — front matter, ERB, and Kramdown, wrapped in a layout.</td></tr>
      <tr><td class="ad-table__code">_layouts/, _includes/</td><td>Plain ERB templates for the page chrome.</td></tr>
      <tr><td class="ad-table__code">_components/, _foundations/, _patterns/</td><td>Static Markdown and HTML — the content itself, hand-written.</td></tr>
    </tbody>
  </table>
</div>

## How the example demos work

Every demo on this site is plain, static markup: a `<figure>` with the live
preview in one `<div>` and, underneath it, a `<details>` holding the exact
same markup as literal, escaped text in a `<pre><code>`. There is no
generator keeping the two in sync — copying the demo's markup by hand into
the page is how the source panel gets written, so there is nothing to drift.

```html
<figure class="example">
  <figcaption>Variants</figcaption>
  <div>
    <button type="button" class="ad-btn">Cancel</button>
    <button type="button" class="ad-btn ad-btn--primary">Save</button>
  </div>
  <details><summary>Markup</summary>
<pre><code>&lt;button type="button" class="ad-btn"&gt;Cancel&lt;/button&gt;
&lt;button type="button" class="ad-btn ad-btn--primary"&gt;Save&lt;/button&gt;</code></pre>
  </details>
</figure>
```
