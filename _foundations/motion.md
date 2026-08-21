---
title: Motion
summary: >-
  Two durations, one easing curve, and one rule that overrides both: if the
  reader asked for less motion, they get none. This is an interface, not a
  title sequence.
---

## Durations

Short ease transitions on hover and focus only — no bounce, no springy
easing, no page-transition choreography.

  <table>
    <thead><tr><th scope="col">Token</th><th scope="col">Value</th><th scope="col">Use for</th></tr></thead>
    <tbody>
      <tr>
        <td><code>--ad-dur-fast</code></td>
        <td><code>0.12s</code></td>
        <td>Hover and focus color/border transitions — the default.</td>
      </tr>
      <tr>
        <td><code>--ad-dur-base</code></td>
        <td><code>0.16s</code></td>
        <td>Switch track and thumb — the one moving part in the system.</td>
      </tr>
    </tbody>
  </table>

## One easing

There is exactly one curve in the system. Hover the tile below to run it.

<ul class="ad-motion-grid">
  <li>
    <div class="ad-motion-demo" tabindex="0">
      <span class="ad-motion-demo__dot"></span>
    </div>
    <div class="ad-specimen__meta"><code>--ad-ease</code></div>
    <p class="ad-muted" style="font-size: var(--ad-step--2); margin: var(--ad-space-3xs) 0 0;">The only easing curve in the system. Fast out, settles gently, applied to every transition.</p>
  </li>
</ul>

## Reduced motion is not a downgrade

`tokens.css` includes a `prefers-reduced-motion: reduce` block that sets
every duration token to `0ms`, and the base stylesheet clamps any remaining
transition or animation to a hundredth of a millisecond. Components do not
have to opt in, and cannot opt out.

```css
@media (prefers-reduced-motion: reduce) {
  :root {
    --ad-dur-fast: 0ms;
    --ad-dur-base: 0ms;
  }
}
```

The state change still happens. The Switch still moves. It simply arrives
instead of traveling.

<figure class="example">
<figcaption>Motion in practice</figcaption>
<div>
<label class="switch">
  <input type="checkbox" role="switch" checked>
  <span></span>
  Dark mode
</label>
<label class="switch">
  <input type="checkbox" role="switch">
  <span></span>
  Weekly digest
</label>
</div>
<details><summary>Markup</summary>
<pre><code>&lt;label class="switch"&gt;
  &lt;input type="checkbox" role="switch" checked&gt;
  &lt;span&gt;&lt;/span&gt;
  Dark mode
&lt;/label&gt;
&lt;label class="switch"&gt;
  &lt;input type="checkbox" role="switch"&gt;
  &lt;span&gt;&lt;/span&gt;
  Weekly digest
&lt;/label&gt;</code></pre>
</details>
</figure>

## Rules

- **Transition named properties, never `all`.** `transition: all` animates
  things you did not think about, including layout.
- **Hover states shift a background one step deeper, never a color or
  opacity trick.** Surface → fill is the whole vocabulary.
- **Press is not animated.** Rely on the hover-darken plus native `:active`,
  if anything at all.
- **Motion is for hover and focus only.** No page-transition choreography.
