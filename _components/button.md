---
title: Button
summary: >-
  No border, no ornament — hierarchy is ink density, not an outline. Five
  variants, three sizes, one geometry.
---

## Variants

`default` is quiet — no fill at rest, a flat tint of the stock on hover, the
same gesture as a CardRow. `primary` is the accent fill — one committing
action per view, at most. `dark` is reserved for the single most committing
action in a screen, typically a final Save; it should be rare. `ghost` is
the same quiet block one step further back — text-secondary instead of
text-primary — for dismissals and tertiary actions. `danger` is destructive
and irreversible only.

<figure class="example">
<figcaption>Variants</figcaption>
<div>
<button>Cancel</button>
<button data-variant="primary">Save</button>
<button data-variant="dark">Finish setup</button>
<button data-variant="ghost">Dismiss</button>
<button data-variant="danger">Delete</button>
</div>
<details open><summary>Markup</summary>
<pre><code>&lt;button&gt;Cancel&lt;/button&gt;
&lt;button data-variant=&quot;primary&quot;&gt;Save&lt;/button&gt;
&lt;button data-variant=&quot;dark&quot;&gt;Finish setup&lt;/button&gt;
&lt;button data-variant=&quot;ghost&quot;&gt;Dismiss&lt;/button&gt;
&lt;button data-variant=&quot;danger&quot;&gt;Delete&lt;/button&gt;</code></pre>
</details>
</figure>

## Sizes

Sizes move one rung down the space scale, and at the two ends of the ramp
one step of font size with it — weight, radius, and letter-spacing never
move. Medium and large pad themselves with the same rung and part on type
size instead; that is what holds their order at every width, since the
space scale is fluid and the size on the wider rung would otherwise
overtake the one on the narrower.

Being fluid, a medium button runs 35–38px tall depending on the width of
the window. [IconButton](<%= relative_url('/components/icon-button/') %>)
builds its square from the same two rungs, so the two are exactly the same
height at every width and in every size — a button and an icon button in a
toolbar line up without either being told the other's measurements.

<figure class="example">
<figcaption>Sizes</figcaption>
<div>
<button data-variant="primary" data-size="sm">Small</button>
<button data-variant="primary">Medium</button>
<button data-variant="primary" data-size="lg">Large</button>
</div>
<details><summary>Markup</summary>
<pre><code>&lt;button data-variant=&quot;primary&quot; data-size=&quot;sm&quot;&gt;Small&lt;/button&gt;
&lt;button data-variant=&quot;primary&quot;&gt;Medium&lt;/button&gt;
&lt;button data-variant=&quot;primary&quot; data-size=&quot;lg&quot;&gt;Large&lt;/button&gt;</code></pre>
</details>
</figure>

## States

Disabled buttons drop to 50% opacity and keep their variant colors, so a
disabled primary still reads as the primary.

<figure class="example">
<figcaption>States</figcaption>
<div>
<button data-variant="primary" disabled="">Disabled</button>
<button aria-disabled="true">Not yet available</button>
</div>
<details><summary>Markup</summary>
<pre><code>&lt;button data-variant=&quot;primary&quot; disabled=&quot;&quot;&gt;Disabled&lt;/button&gt;
&lt;button aria-disabled=&quot;true&quot;&gt;Not yet available&lt;/button&gt;</code></pre>
</details>
</figure>

<div class="gl-callout">
  <p class="type-label">disabled vs. aria-disabled</p>
  <p>
    A <code>disabled</code> button is removed from the tab order, so a reader
    navigating by keyboard never learns it is there. When a button is
    temporarily unavailable and the reason matters, use
    <code>aria-disabled="true"</code> instead — it stays focusable and can
    carry an explanation.
  </p>
</div>

## With an icon

Pass an icon as the first child. The gap is `--gl-space-2xs`, set by the
button itself.

<figure class="example">
<figcaption>Icon</figcaption>
<div>
<button data-variant="primary">
  <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.9" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M12 5v14M5 12h14" /></svg>
  New
</button>
</div>
<details><summary>Markup</summary>
<pre><code>&lt;button data-variant=&quot;primary&quot;&gt;
  &lt;svg width=&quot;14&quot; height=&quot;14&quot; viewBox=&quot;0 0 24 24&quot; fill=&quot;none&quot; stroke=&quot;currentColor&quot; stroke-width=&quot;1.9&quot; stroke-linecap=&quot;round&quot; stroke-linejoin=&quot;round&quot; aria-hidden=&quot;true&quot;&gt;&lt;path d=&quot;M12 5v14M5 12h14&quot; /&gt;&lt;/svg&gt;
  New
&lt;/button&gt;</code></pre>
</details>
</figure>

## Groups

`[role="group"]` is already the correct ARIA role for a toolbar of related
buttons, so it doubles as the styling hook — no wrapper class.

<figure class="example">
<figcaption>Button group</figcaption>
<div>
<div role="group" aria-label="View">
  <button data-size="sm">List</button>
  <button data-size="sm">Board</button>
  <button data-size="sm">Calendar</button>
</div>
</div>
<details><summary>Markup</summary>
<pre><code>&lt;div role=&quot;group&quot; aria-label=&quot;View&quot;&gt;
  &lt;button data-size=&quot;sm&quot;&gt;List&lt;/button&gt;
  &lt;button data-size=&quot;sm&quot;&gt;Board&lt;/button&gt;
  &lt;button data-size=&quot;sm&quot;&gt;Calendar&lt;/button&gt;
&lt;/div&gt;</code></pre>
</details>
</figure>

## Full width

<figure class="example">
<figcaption>Block</figcaption>
<div data-layout="stack">
<button data-variant="primary" data-block>Take a photo</button>
</div>
<details><summary>Markup</summary>
<pre><code>&lt;button data-variant=&quot;primary&quot; data-block&gt;Take a photo&lt;/button&gt;</code></pre>
</details>
</figure>

## Links that act like buttons

An `<a>` with `.btn` is fine when the thing it does is navigate. A `<button>`
is required when it changes something. `.btn` exists only because a bare `a`
selector would catch every ordinary prose link on the site — it is the one
class Button needs, and only anchors reach for it.

<figure class="example">
<figcaption>Anchor as button</figcaption>
<div>
<a class="btn" data-variant="primary" href="/gloss/components/icon-button/">Next: IconButton</a>
<a class="btn" data-variant="ghost" href="/gloss/foundations/color/">Back to color</a>
</div>
<details><summary>Markup</summary>
<pre><code>&lt;a class=&quot;btn&quot; data-variant=&quot;primary&quot; href=&quot;/gloss/components/icon-button/&quot;&gt;Next: IconButton&lt;/a&gt;
&lt;a class=&quot;btn&quot; data-variant=&quot;ghost&quot; href=&quot;/gloss/foundations/color/&quot;&gt;Back to color&lt;/a&gt;</code></pre>
</details>
</figure>

## API

<table>
  <thead><tr><th scope="col">Element / attribute</th><th scope="col">Values</th><th scope="col">Notes</th></tr></thead>
  <tbody>
    <tr><td><code>button</code></td><td></td><td>Required base. A bare <code>&lt;button&gt;</code> is styled directly — no class. Use <code>&lt;a class="btn"&gt;</code> instead when the control navigates.</td></tr>
    <tr><td><code>data-variant</code></td><td><code>primary | dark | ghost | danger</code></td><td>Omit for the default, quiet look — no fill at rest.</td></tr>
    <tr><td><code>data-size</code></td><td><code>sm | lg</code></td><td>Omit for the default (medium) size. Padding, plus one step of font size at each end.</td></tr>
    <tr><td><code>data-block</code></td><td>boolean</td><td>Full width of its container.</td></tr>
    <tr><td><code>disabled</code></td><td>boolean</td><td>Removes the button from the tab order.</td></tr>
    <tr><td><code>aria-disabled</code></td><td><code>"true"</code></td><td>Looks disabled, stays focusable.</td></tr>
    <tr><td><code>[role="group"]</code></td><td></td><td>Wrap adjacent buttons in a group to join their radii; a hairline divider separates them, since the buttons themselves carry no border.</td></tr>
  </tbody>
</table>
