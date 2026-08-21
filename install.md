---
title: Using the CSS
permalink: /install/
section: Start here
summary: >-
  Two stylesheets, no JavaScript, no build step. Then a dozen custom properties
  if you want it to stop looking like this site.
---

## The two files

The system compiles to exactly two stylesheets. `tokens.css` is generated from
YAML by a Jekyll plugin; `style.css` is the components. The order matters —
the components read the custom properties the tokens define.

```html
<link rel="stylesheet" href="tokens.css">
<link rel="stylesheet" href="style.css">
```

Both are on this site at
[`/assets/css/tokens.css`]({{ '/assets/css/tokens.css' | relative_url }}) and
[`/assets/css/style.css`]({{ '/assets/css/style.css' | relative_url }}).
The generated token file is {{ site.data.tokens_css_size }} bytes uncompressed.

Nothing in the components needs JavaScript. `assets/js/system.js` adds keyboard
handling for [Tabs]({{ '/components/tabs/' | relative_url }}), the theme toggle,
and the copy buttons on this site — that is all it is for.

## Dark theme

The token file emits the dark palette twice: once under
`@media (prefers-color-scheme: dark)`, so a reader who has never touched your UI
still gets the right theme, and once under `:root[data-theme="dark"]`, so an
explicit choice beats the media query in both directions.

```css
:root { --ad-color-canvas: #faf9f7; }

@media (prefers-color-scheme: dark) {
  :root:not([data-theme="light"]) { --ad-color-canvas: #171512; }
}

:root[data-theme="dark"] { --ad-color-canvas: #171512; }
```

To wire up a toggle, set or clear `data-theme` on `<html>` and persist the
choice. Apply it in a blocking inline script in `<head>` or the page will flash
the wrong theme before your bundle runs.

## Retheming

Because every component reads an alias, retheming is a matter of repointing a
dozen custom properties after the token file loads. No recompile, no fork.

```css
:root {
  --ad-color-accent: #1d5bd8;
  --ad-color-accent-hover: #1e4baf;
  --ad-color-accent-subtle: #eff7ff;
  --ad-color-accent-border: #bfdffe;
  --ad-color-on-accent: #ffffff;

  --ad-radius-sm: 2px;
  --ad-radius-md: 3px;
  --ad-font-sans: "Söhne", system-ui, sans-serif;
}
```

<div class="ad-callout ad-callout--caution">
  <div class="ad-callout__body">
    <p class="ad-callout__title">Re-check contrast after retheming</p>
    <p style="margin:0">
      The system's contrast guarantees are about the system's own values. Swap the
      accent and you own the result. The checker is a hundred lines of dependency-free
      Ruby in <code>lib/arbitrary_definitions/color_math.rb</code> if you want to
      run the same assertions against your palette.
    </p>
  </div>
</div>

## Building this site

The plugins in `_plugins/` mean the GitHub-hosted Jekyll build will not run this
site, so it builds on GitHub Actions and uploads the result to Pages. Locally:

```console
$ rbenv install 4.0.6      # or however you get Ruby 4.0
$ bundle install
$ bundle exec rake         # runs the token tests, then builds
$ bundle exec rake serve   # http://127.0.0.1:4000
```

## What is where

<div class="ad-table-wrap">
  <table class="ad-table ad-table--compact">
    <thead><tr><th scope="col">Path</th><th scope="col">What it is</th></tr></thead>
    <tbody>
      <tr><td class="ad-table__code">_data/tokens/</td><td>The three YAML files. Every value in the system.</td></tr>
      <tr><td class="ad-table__code">lib/arbitrary_definitions/</td><td>Token compiler and WCAG colour maths. No Jekyll dependency, so it is unit tested on its own.</td></tr>
      <tr><td class="ad-table__code">_plugins/</td><td>The Jekyll wiring: a generator, Liquid filters, and the <code>{% raw %}{% example %}{% endraw %}</code> block.</td></tr>
      <tr><td class="ad-table__code">_sass/components/</td><td>One stylesheet per component. No hexes, no pixels.</td></tr>
      <tr><td class="ad-table__code">test/</td><td>Minitest. Contrast floors, ramp monotonicity, CSS well-formedness.</td></tr>
    </tbody>
  </table>
</div>

## How the example blocks work

Every demo on this site is one Liquid block. The plugin renders its body twice —
live into the page, and Rouge-highlighted into the source panel underneath.

{% raw %}
```liquid
{% example title="Variants" open %}
<button type="button" class="ad-btn ad-btn--primary">Publish</button>
<button type="button" class="ad-btn ad-btn--ghost">Cancel</button>
{% endexample %}
```
{% endraw %}

There is no second copy of the markup to keep in sync, which is the usual way
component documentation starts lying about the component.
