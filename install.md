---
title: Using the CSS
permalink: /install/
section: Start here
summary: >-
  Three stylesheets, almost no JavaScript, no build step. Then a dozen custom
  properties if you want it to stop looking like this site.
---

## The three files

The system compiles to three stylesheets you'd actually reuse elsewhere.
`tokens.css` is a hand-maintained block of custom properties; `base.css` is
reset and typography; `components.css` is the components. The order
matters — each file reads custom properties the one before it defines.

```html
<link rel="stylesheet" href="tokens.css">
<link rel="stylesheet" href="base.css">
<link rel="stylesheet" href="components.css">
```

All three are on this site at
[`/assets/css/tokens.css`](<%= relative_url('/assets/css/tokens.css') %>),
[`/assets/css/base.css`](<%= relative_url('/assets/css/base.css') %>), and
[`/assets/css/components.css`](<%= relative_url('/assets/css/components.css') %>).
This site also loads `docs.css` and `patterns.css` — its own sidebar/header
chrome and the Loop/Archive pattern-page CSS — but neither is part of the
design system, so don't link them elsewhere.

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

Dark mode is opt-in via a `data-theme="dark"` attribute plus
`prefers-color-scheme`, applied explicitly rather than inherited silently
from the OS — the toggle UI on every page depends on this exact mechanism.
Both repoint the same semantic aliases at the inverted neutral ramp.

```css
:root { --gl-color-surface-page: #faf9f7; }

@media (prefers-color-scheme: dark) {
  :root:not([data-theme="light"]) { --gl-color-surface-page: #0e0d0b; }
}

:root[data-theme="dark"] { --gl-color-surface-page: #0e0d0b; }
```

To wire up your own toggle, set or clear `data-theme` on `<html>` and persist
the choice. Apply it in a blocking inline script in `<head>` or the page will
flash the wrong theme before your bundle runs.

## Retheming

Because every component reads an alias, retheming is a matter of repointing
a handful of custom properties after the token file loads — most of all,
`--gl-color-accent`, which `-ink` and `-soft` re-derive from automatically via
`color-mix()`.

```css
:root {
  --gl-color-accent: #9a5a3c; /* Clay */
}
```

<div class="gl-callout">
  <p>
    Re-check contrast after retheming. The system's contrast guarantees on
    the <a href="<%= relative_url('/foundations/color/') %>">Color page</a>
    are about the system's own values — swap the accent and you own the
    result. The WCAG 2.1 relative-luminance formula is standard and easy to
    run against your own palette if you want the same numbers.
  </p>
</div>

## Building this site

There is no Jekyll here — the whole site is a Rakefile driving plain ERB
templates and Kramdown (see `lib/build.rb`). It still builds on GitHub
Actions and uploads the result to Pages, mainly so the build always runs on
the pinned Ruby 4.0 rather than whatever GitHub's Pages runner happens to
ship. Locally:

```console
$ rbenv install 4.0.6      # or however you get Ruby 4.0
$ bundle install
$ bundle exec rake         # builds the site into _site/
$ bundle exec rake serve   # http://127.0.0.1:4000
```

## What is where

  <table>
    <thead><tr><th scope="col">Path</th><th scope="col">What it is</th></tr></thead>
    <tbody>
      <tr><td><code>assets/css/tokens.css</code></td><td>Every value in the system, hand-maintained.</td></tr>
      <tr><td><code>_sass/</code></td><td>One plain CSS file per component group, concatenated into <code>base.css</code>, <code>components.css</code>, <code>docs.css</code>, and <code>patterns.css</code> at build time (see <code>CSS_BUNDLES</code> in <code>lib/build.rb</code>). No hexes, no pixels, no durations.</td></tr>
      <tr><td><code>lib/build.rb</code></td><td>The whole site builder in one file — a literal list of pages, front matter, ERB, and Kramdown.</td></tr>
      <tr><td><code>_layouts/page.erb</code></td><td>The one page shell (head, header, sidebar, footer).</td></tr>
      <tr><td><code>_components/, _foundations/, _patterns/</code></td><td>Static Markdown and HTML — the content itself, hand-written.</td></tr>
    </tbody>
  </table>

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
    <button>Cancel</button>
    <button data-variant="primary">Save</button>
  </div>
  <details><summary>Markup</summary>
<pre><code>&lt;button&gt;Cancel&lt;/button&gt;
&lt;button data-variant="primary"&gt;Save&lt;/button&gt;</code></pre>
  </details>
</figure>
```
