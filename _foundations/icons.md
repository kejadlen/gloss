---
title: Icons
summary: >-
  Icons are tokens, like colors. A component gets one by setting a custom
  property, never by carrying an &lt;svg&gt; in its markup, and the icon
  takes the text's color and size.
---

## Placing an icon

Set `--gl-icon` on a Button, IconButton, or Avatar. Each one decides where
its icon goes, so the markup only names the icon:

```html
<button style="--gl-icon: var(--gl-icon-plus)">New</button>
```

The property can come from a stylesheet as easily as an inline style, and
it reacts to anything a selector can:

```css
button[data-action="delete"] { --gl-icon: var(--gl-icon-trash); }
:root[data-theme="dark"] [data-theme-toggle] { --gl-icon: var(--gl-icon-moon); }
```

Any other element takes `--gl-icon-start`, drawn in its `::before`, or
`--gl-icon-end`, drawn in its `::after`. An icon replaces whatever that
pseudo-element would otherwise draw.

None of the three properties inherit: an icon set on a `<p>` does not
repeat on every link inside it.

## Tokens

Every icon is a monochrome SVG on a 24-unit grid with rounded strokes. It
is painted as a mask, so the stroke color written into the token never
shows.

<table>
  <thead><tr><th scope="col">Token</th><th scope="col">Icon</th><th scope="col">Use for</th></tr></thead>
  <tbody>
    <tr><td><code>--gl-icon-camera</code></td><td><span style="--gl-icon-start: var(--gl-icon-camera)"></span></td><td>Capturing a photo.</td></tr>
    <tr><td><code>--gl-icon-chevron-left</code></td><td><span style="--gl-icon-start: var(--gl-icon-chevron-left)"></span></td><td>Back, in a header.</td></tr>
    <tr><td><code>--gl-icon-chevron-down</code></td><td><span style="--gl-icon-start: var(--gl-icon-chevron-down)"></span></td><td>Select's own chevron. It is the one icon Select paints as a background, so its stroke carries <code>--gl-color-text-secondary</code> and is redefined for the dark theme.</td></tr>
    <tr><td><code>--gl-icon-filter</code></td><td><span style="--gl-icon-start: var(--gl-icon-filter)"></span></td><td>Narrowing a list.</td></tr>
    <tr><td><code>--gl-icon-moon</code></td><td><span style="--gl-icon-start: var(--gl-icon-moon)"></span></td><td>The dark theme, in a theme toggle.</td></tr>
    <tr><td><code>--gl-icon-package</code></td><td><span style="--gl-icon-start: var(--gl-icon-package)"></span></td><td>A stored file or item, in an Avatar.</td></tr>
    <tr><td><code>--gl-icon-plus</code></td><td><span style="--gl-icon-start: var(--gl-icon-plus)"></span></td><td>Creating something new.</td></tr>
    <tr><td><code>--gl-icon-settings</code></td><td><span style="--gl-icon-start: var(--gl-icon-settings)"></span></td><td>Opening settings.</td></tr>
    <tr><td><code>--gl-icon-sun</code></td><td><span style="--gl-icon-start: var(--gl-icon-sun)"></span></td><td>The light theme, in a theme toggle.</td></tr>
    <tr><td><code>--gl-icon-trash</code></td><td><span style="--gl-icon-start: var(--gl-icon-trash)"></span></td><td>Deleting.</td></tr>
  </tbody>
</table>

A new icon is one more line in `tokens.css`: a `url()` holding an SVG,
with `<`, `>`, and `#` percent-encoded.

## Styling

These properties do inherit, so setting one on a container styles every
icon inside it:

<table>
  <thead><tr><th scope="col">Property</th><th scope="col">Default</th><th scope="col">Effect</th></tr></thead>
  <tbody>
    <tr><td><code>--gl-icon-style-size</code></td><td><code>1em</code></td><td>Width and height.</td></tr>
    <tr><td><code>--gl-icon-style-color</code></td><td><code>currentColor</code></td><td>Fill. Point it at a color token, never a literal.</td></tr>
    <tr><td><code>--gl-icon-style-spacing</code></td><td><code>0.3em</code></td><td>Gap between the icon and the text beside it. Button, IconButton, and Avatar set it to zero and space with their own layout.</td></tr>
    <tr><td><code>--gl-icon-style-voffset</code></td><td><code>-0.02em</code></td><td>Optical nudge. The icon is centered on the cap height, and a positive value moves it up.</td></tr>
  </tbody>
</table>

## Limits

- An icon has one color. A multicolor mark stays inline SVG.
- An icon can't have its own background or border. Put those on the
  element and the icon inside it, as Avatar does.
- An icon can't animate its paths. It can change on any state a selector
  can reach, but it swaps, not morphs.

The approach, and the WebKit workarounds in `components/icon.css`, come
from Lea Verou's [The best way to use icons on the Web](https://lea.verou.me/blog/2026/icons/)
and her `@nudeui/icons` package.
