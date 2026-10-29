---
title: Color
summary: >-
  Two neutral ramps, five accents, two fixed semantic colors, eighteen
  semantic aliases. Low-chroma warm-gray, never stark white or black.
---

## The two layers

The system separates *what a color is* from *what a color is for*.

The **ramps** below are raw material: ten steps of neutral (light), the same
ten inverted for dark mode, and five accent hues. No component references
them directly.

The **aliases** underneath are the working vocabulary — `--gl-color-text-primary`,
`--gl-color-surface-card`, `--gl-color-accent`. Every component stylesheet
reads from these. Retheming, or switching to dark, means repointing aliases
at different values — which is exactly what the dark block does.

<div class="gl-callout">
  <p>
    The neutral ramps were authored in <code>oklch()</code>. Every value
    below is that same color converted to flat sRGB hex — not re-picked,
    not rounded. The contrast figures on this page are computed from those
    hex values with the standard WCAG 2.1 relative-luminance
    formula, then transcribed here as fact rather than typed by eye.
  </p>
</div>

## Neutral

Low-chroma warm-gray, never stark white or black. Ten steps, not twelve or
sixteen — the palette defines exactly these.

<p class="gl-muted">Low-chroma warm-gray. Not stark white or black. Ten steps, not twelve: exactly 0/50/100/150/200/300/500/600/800/900 — steps 400 and 700 do not exist.</p>
<ul class="gl-swatch-grid">
  <li class="gl-swatch">
    <div class="gl-swatch__chip" style="background: #faf9f7; color: #171512;">n-0</div>
    <div class="gl-swatch__meta">
      <span class="gl-swatch__hex">#faf9f7</span>
      <span class="gl-swatch__ratio">1.05 on white</span>
    </div>
  </li>
  <li class="gl-swatch">
    <div class="gl-swatch__chip" style="background: #fdfdfb; color: #171512;">n-50</div>
    <div class="gl-swatch__meta">
      <span class="gl-swatch__hex">#fdfdfb</span>
      <span class="gl-swatch__ratio">1.02 on white</span>
    </div>
  </li>
  <li class="gl-swatch">
    <div class="gl-swatch__chip" style="background: #f1f0ed; color: #171512;">n-100</div>
    <div class="gl-swatch__meta">
      <span class="gl-swatch__hex">#f1f0ed</span>
      <span class="gl-swatch__ratio">1.14 on white</span>
    </div>
  </li>
  <li class="gl-swatch">
    <div class="gl-swatch__chip" style="background: #e8e6e2; color: #171512;">n-150</div>
    <div class="gl-swatch__meta">
      <span class="gl-swatch__hex">#e8e6e2</span>
      <span class="gl-swatch__ratio">1.25 on white</span>
    </div>
  </li>
  <li class="gl-swatch">
    <div class="gl-swatch__chip" style="background: #dcdad7; color: #171512;">n-200</div>
    <div class="gl-swatch__meta">
      <span class="gl-swatch__hex">#dcdad7</span>
      <span class="gl-swatch__ratio">1.40 on white</span>
    </div>
  </li>
  <li class="gl-swatch">
    <div class="gl-swatch__chip" style="background: #c0bdb9; color: #171512;">n-300</div>
    <div class="gl-swatch__meta">
      <span class="gl-swatch__hex">#c0bdb9</span>
      <span class="gl-swatch__ratio">1.87 on white</span>
    </div>
  </li>
  <li class="gl-swatch">
    <div class="gl-swatch__chip" style="background: #888681; color: #171512;">n-500</div>
    <div class="gl-swatch__meta">
      <span class="gl-swatch__hex">#888681</span>
      <span class="gl-swatch__ratio">3.64 on white</span>
    </div>
  </li>
  <li class="gl-swatch">
    <div class="gl-swatch__chip" style="background: #5f5d59; color: #ffffff;">n-600</div>
    <div class="gl-swatch__meta">
      <span class="gl-swatch__hex">#5f5d59</span>
      <span class="gl-swatch__ratio">6.57 on white</span>
    </div>
  </li>
  <li class="gl-swatch">
    <div class="gl-swatch__chip" style="background: #2a2926; color: #ffffff;">n-800</div>
    <div class="gl-swatch__meta">
      <span class="gl-swatch__hex">#2a2926</span>
      <span class="gl-swatch__ratio">14.55 on white</span>
    </div>
  </li>
  <li class="gl-swatch">
    <div class="gl-swatch__chip" style="background: #100f0d; color: #ffffff;">n-900</div>
    <div class="gl-swatch__meta">
      <span class="gl-swatch__hex">#100f0d</span>
      <span class="gl-swatch__ratio">19.16 on white</span>
    </div>
  </li>
</ul>

<p class="gl-muted">The same low-chroma warm-gray scale, inverted for dark mode. Same ten step numbers as `neutral`; `0` is the darkest step here (the dark-theme page background) rather than the lightest.</p>
<ul class="gl-swatch-grid">
  <li class="gl-swatch">
    <div class="gl-swatch__chip" style="background: #0e0d0b; color: #ffffff;">nd-0</div>
    <div class="gl-swatch__meta">
      <span class="gl-swatch__hex">#0e0d0b</span>
      <span class="gl-swatch__ratio">1.08 on black</span>
    </div>
  </li>
  <li class="gl-swatch">
    <div class="gl-swatch__chip" style="background: #151412; color: #ffffff;">nd-50</div>
    <div class="gl-swatch__meta">
      <span class="gl-swatch__hex">#151412</span>
      <span class="gl-swatch__ratio">1.14 on black</span>
    </div>
  </li>
  <li class="gl-swatch">
    <div class="gl-swatch__chip" style="background: #1e1d1a; color: #ffffff;">nd-100</div>
    <div class="gl-swatch__meta">
      <span class="gl-swatch__hex">#1e1d1a</span>
      <span class="gl-swatch__ratio">1.25 on black</span>
    </div>
  </li>
  <li class="gl-swatch">
    <div class="gl-swatch__chip" style="background: #252421; color: #ffffff;">nd-150</div>
    <div class="gl-swatch__meta">
      <span class="gl-swatch__hex">#252421</span>
      <span class="gl-swatch__ratio">1.35 on black</span>
    </div>
  </li>
  <li class="gl-swatch">
    <div class="gl-swatch__chip" style="background: #2c2b29; color: #ffffff;">nd-200</div>
    <div class="gl-swatch__meta">
      <span class="gl-swatch__hex">#2c2b29</span>
      <span class="gl-swatch__ratio">1.48 on black</span>
    </div>
  </li>
  <li class="gl-swatch">
    <div class="gl-swatch__chip" style="background: #44423f; color: #ffffff;">nd-300</div>
    <div class="gl-swatch__meta">
      <span class="gl-swatch__hex">#44423f</span>
      <span class="gl-swatch__ratio">2.10 on black</span>
    </div>
  </li>
  <li class="gl-swatch">
    <div class="gl-swatch__chip" style="background: #7c7a76; color: #000000;">nd-500</div>
    <div class="gl-swatch__meta">
      <span class="gl-swatch__hex">#7c7a76</span>
      <span class="gl-swatch__ratio">4.90 on black</span>
    </div>
  </li>
  <li class="gl-swatch">
    <div class="gl-swatch__chip" style="background: #a09e9a; color: #171512;">nd-600</div>
    <div class="gl-swatch__meta">
      <span class="gl-swatch__hex">#a09e9a</span>
      <span class="gl-swatch__ratio">7.85 on black</span>
    </div>
  </li>
  <li class="gl-swatch">
    <div class="gl-swatch__chip" style="background: #d9d7d4; color: #171512;">nd-800</div>
    <div class="gl-swatch__meta">
      <span class="gl-swatch__hex">#d9d7d4</span>
      <span class="gl-swatch__ratio">14.62 on black</span>
    </div>
  </li>
  <li class="gl-swatch">
    <div class="gl-swatch__chip" style="background: #e9e8e6; color: #171512;">nd-900</div>
    <div class="gl-swatch__meta">
      <span class="gl-swatch__hex">#e9e8e6</span>
      <span class="gl-swatch__ratio">17.15 on black</span>
    </div>
  </li>
</ul>

## Accent

One swappable accent per project — never two in the same view. Signal Teal is
the default; the other four are the sanctioned menu a project can switch to.

<ul class="gl-accent-grid">
  <li>
    <div class="gl-accent-demo" style="background: #3a6a63;">teal (default)</div>
    <div class="gl-specimen__meta"><code>#3a6a63</code><span>6.14:1 on white</span></div>
    <p class="gl-muted" style="font-size: var(--gl-step--2); margin: var(--gl-space-3xs) 0 0;">Default. Neutral, technical.</p>
  </li>
  <li>
    <div class="gl-accent-demo" style="background: #9a5a3c;">clay</div>
    <div class="gl-specimen__meta"><code>#9a5a3c</code><span>5.38:1 on white</span></div>
    <p class="gl-muted" style="font-size: var(--gl-step--2); margin: var(--gl-space-3xs) 0 0;">Warm, archival.</p>
  </li>
  <li>
    <div class="gl-accent-demo" style="background: #2b4a78;">ink-blue</div>
    <div class="gl-specimen__meta"><code>#2b4a78</code><span>8.92:1 on white</span></div>
    <p class="gl-muted" style="font-size: var(--gl-step--2); margin: var(--gl-space-3xs) 0 0;">Sober, utilitarian.</p>
  </li>
  <li>
    <div class="gl-accent-demo" style="background: #93701f;">ochre</div>
    <div class="gl-specimen__meta"><code>#93701f</code><span>4.59:1 on white</span></div>
    <p class="gl-muted" style="font-size: var(--gl-step--2); margin: var(--gl-space-3xs) 0 0;">Dry, papery.</p>
  </li>
  <li>
    <div class="gl-accent-demo" style="background: #6a3a5c;">plum</div>
    <div class="gl-specimen__meta"><code>#6a3a5c</code><span>8.85:1 on white</span></div>
    <p class="gl-muted" style="font-size: var(--gl-step--2); margin: var(--gl-space-3xs) 0 0;">Quiet, personal.</p>
  </li>
</ul>

<div class="gl-callout">
  <p>
    All five clear AA (4.5:1) for white text at their own value, but Ochre is
    the tightest of the five at roughly 4.6:1 — closer to the floor than the
    others (Ink Blue and Plum both clear 8.5:1). That is a real property of a
    dry, papery ochre and is not being rounded away; a project choosing Ochre
    as its accent should re-check any place it sets small white text directly
    on the accent fill, rather than through <code>--gl-color-accent-fg</code>
    on a full-size Button.
  </p>
</div>

## Semantic aliases

Both themes, side by side. The left half of each chip is the light value and
the right half is the dark one.

### Surfaces

<p class="gl-muted">Backgrounds, from the page itself up to a card sitting on it. In light mode the page is a full ramp step under the card, not the half step between neutral.0 and neutral.50, which was too fine for a card to read against; the two fills step down with it.</p>

  <table>
    <thead>
      <tr>
        <th scope="col">Token</th>
        <th scope="col">Light</th>
        <th scope="col">Dark</th>
        <th scope="col">Use for</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <div class="gl-alias-row">
            <span class="gl-alias-chip gl-alias-chip--pair" aria-hidden="true">
              <span style="background: #f1f0ed"></span>
              <span style="background: #0e0d0b"></span>
            </span>
            <code>--gl-color-surface-page</code>
          </div>
        </td>
        <td><code>neutral.100</code></td>
        <td><code>neutral_dark.0</code></td>
        <td>The page itself. Nothing sits behind it.</td>
      </tr>
      <tr>
        <td>
          <div class="gl-alias-row">
            <span class="gl-alias-chip gl-alias-chip--pair" aria-hidden="true">
              <span style="background: #fdfdfb"></span>
              <span style="background: #151412"></span>
            </span>
            <code>--gl-color-surface-card</code>
          </div>
        </td>
        <td><code>neutral.50</code></td>
        <td><code>neutral_dark.50</code></td>
        <td>Cards, dialogs, toasts — anything that reads as a sheet on the page.</td>
      </tr>
      <tr>
        <td>
          <div class="gl-alias-row">
            <span class="gl-alias-chip gl-alias-chip--pair" aria-hidden="true">
              <span style="background: #e8e6e2"></span>
              <span style="background: #1e1d1a"></span>
            </span>
            <code>--gl-color-surface-fill</code>
          </div>
        </td>
        <td><code>neutral.150</code></td>
        <td><code>neutral_dark.100</code></td>
        <td>Recessed fill — a hovered row, a segmented-tab track, a photo placeholder.</td>
      </tr>
      <tr>
        <td>
          <div class="gl-alias-row">
            <span class="gl-alias-chip gl-alias-chip--pair" aria-hidden="true">
              <span style="background: #dcdad7"></span>
              <span style="background: #252421"></span>
            </span>
            <code>--gl-color-surface-fill-2</code>
          </div>
        </td>
        <td><code>neutral.200</code></td>
        <td><code>neutral_dark.150</code></td>
        <td>A second, deeper fill step — the diagonal-grain stripe inside an empty photo slot.</td>
      </tr>
    </tbody>
  </table>

### Borders

<p class="gl-muted">Two weights. Hairlines divide inside a surface and stay faint; the default weight outlines a control, so it has to clear WCAG 1.4.11's 3:1.</p>

  <table>
    <thead>
      <tr>
        <th scope="col">Token</th>
        <th scope="col">Light</th>
        <th scope="col">Dark</th>
        <th scope="col">Use for</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <div class="gl-alias-row">
            <span class="gl-alias-chip gl-alias-chip--pair" aria-hidden="true">
              <span style="background: #dcdad7"></span>
              <span style="background: #2c2b29"></span>
            </span>
            <code>--gl-color-border-hairline</code>
          </div>
        </td>
        <td><code>neutral.200</code></td>
        <td><code>neutral_dark.200</code></td>
        <td>Card edges, row dividers, dialog dividers. The default edge everywhere.</td>
      </tr>
      <tr>
        <td>
          <div class="gl-alias-row">
            <span class="gl-alias-chip gl-alias-chip--pair" aria-hidden="true">
              <span style="background: #888681"></span>
              <span style="background: #7c7a76"></span>
            </span>
            <code>--gl-color-border-default</code>
          </div>
        </td>
        <td><code>neutral.500</code></td>
        <td><code>neutral_dark.500</code></td>
        <td>The edge of a control — an input, a select, a switch's track. Holds 3:1 against the card and the page.</td>
      </tr>
    </tbody>
  </table>

### Text

<p class="gl-muted">Three levels of emphasis, deliberately not four. Past three, a reader stops perceiving a hierarchy and starts perceiving noise.</p>

  <table>
    <thead>
      <tr>
        <th scope="col">Token</th>
        <th scope="col">Light</th>
        <th scope="col">Dark</th>
        <th scope="col">Use for</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <div class="gl-alias-row">
            <span class="gl-alias-chip gl-alias-chip--pair" aria-hidden="true">
              <span style="background: #100f0d"></span>
              <span style="background: #e9e8e6"></span>
            </span>
            <code>--gl-color-text-primary</code>
          </div>
        </td>
        <td><code>neutral.900</code></td>
        <td><code>neutral_dark.900</code></td>
        <td>Body copy, headings, and every control label.</td>
      </tr>
      <tr>
        <td>
          <div class="gl-alias-row">
            <span class="gl-alias-chip gl-alias-chip--pair" aria-hidden="true">
              <span style="background: #5f5d59"></span>
              <span style="background: #a09e9a"></span>
            </span>
            <code>--gl-color-text-secondary</code>
          </div>
        </td>
        <td><code>neutral.600</code></td>
        <td><code>neutral_dark.600</code></td>
        <td>Supporting copy, hints, mono meta values, type-label's color.</td>
      </tr>
      <tr>
        <td>
          <div class="gl-alias-row">
            <span class="gl-alias-chip gl-alias-chip--pair" aria-hidden="true">
              <span style="background: #686662"></span>
              <span style="background: #8f8d89"></span>
            </span>
            <code>--gl-color-text-tertiary</code>
          </div>
        </td>
        <td><code>#686662</code></td>
        <td><code>#8f8d89</code></td>
        <td>Placeholders, hints and de-emphasized metadata — never body text. Off the ramp on purpose: the darkest gray that still sits under secondary while clearing 4.5:1 on the page, card and fill.</td>
      </tr>
    </tbody>
  </table>

### Accent

<p class="gl-muted">One swappable accent per project, held constant across a whole view. `-text`, `-ink` and `-soft` re-derive from `--gl-color-accent` via `color-mix()`, so retheming the accent retones all three automatically, in both themes. Dark mode mixes them toward white and the card instead of toward black and white, since the fill-strength accent is only 3:1 on a dark card.</p>

  <table>
    <thead>
      <tr>
        <th scope="col">Token</th>
        <th scope="col">Light</th>
        <th scope="col">Dark</th>
        <th scope="col">Use for</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <div class="gl-alias-row">
            <span class="gl-alias-chip gl-alias-chip--pair" aria-hidden="true">
              <span style="background: #3a6a63"></span>
              <span style="background: #3a6a63"></span>
            </span>
            <code>--gl-color-accent</code>
          </div>
        </td>
        <td><code>accent.teal</code></td>
        <td><code>accent.teal</code></td>
        <td>Primary buttons, links, focus affordance, the active tab underline. Never two accents in one view.</td>
      </tr>
      <tr>
        <td>
          <div class="gl-alias-row">
            <span class="gl-alias-chip gl-alias-chip--pair" aria-hidden="true">
              <span style="background: #ffffff"></span>
              <span style="background: #ffffff"></span>
            </span>
            <code>--gl-color-accent-fg</code>
          </div>
        </td>
        <td><code>#ffffff</code></td>
        <td><code>#ffffff</code></td>
        <td>Label and icon color on a filled accent surface. Fixed white, not a ramp reference.</td>
      </tr>
      <tr>
        <td>
          <div class="gl-alias-row">
            <span class="gl-alias-chip gl-alias-chip--pair" aria-hidden="true">
              <span style="background: #3a6a63"></span>
              <span style="background: #90aba6"></span>
            </span>
            <code>--gl-color-accent-text</code>
          </div>
        </td>
        <td><code>var(--gl-color-accent)</code></td>
        <td><code>color-mix(in oklch, var(--gl-color-accent) 55%, white)</code></td>
        <td>The accent as a foreground on a neutral surface — links, the focus ring, the selected-tab bar, a focused input's border.</td>
      </tr>
      <tr>
        <td>
          <div class="gl-alias-row">
            <span class="gl-alias-chip" aria-hidden="true" style="background: repeating-linear-gradient(45deg, var(--gl-color-surface-fill) 0 4px, var(--gl-color-surface-card) 4px 8px);"></span>
            <code>--gl-color-accent-ink</code>
          </div>
        </td>
        <td><code>color-mix(in oklch, var(--gl-color-accent) 78%, black)</code></td>
        <td><code>color-mix(in oklch, var(--gl-color-accent) 40%, white)</code></td>
        <td>Text sitting on an `-soft` accent tint — an IconButton's active state, an accent avatar's initials.</td>
      </tr>
      <tr>
        <td>
          <div class="gl-alias-row">
            <span class="gl-alias-chip" aria-hidden="true" style="background: repeating-linear-gradient(45deg, var(--gl-color-surface-fill) 0 4px, var(--gl-color-surface-card) 4px 8px);"></span>
            <code>--gl-color-accent-soft</code>
          </div>
        </td>
        <td><code>color-mix(in oklch, var(--gl-color-accent) 12%, white)</code></td>
        <td><code>color-mix(in oklch, var(--gl-color-accent) 16%, var(--gl-color-surface-card))</code></td>
        <td>The tint behind an accent Badge, a toggled IconButton, an accent avatar chip.</td>
      </tr>
    </tbody>
  </table>

### Status

<p class="gl-muted">Exactly two states, both fixed — they read the same in every project and are never swapped the way the accent is. Dark mode lifts each one so it still reads as text on a dark card, and mixes the tints into the card rather than white.</p>

  <table>
    <thead>
      <tr>
        <th scope="col">Token</th>
        <th scope="col">Light</th>
        <th scope="col">Dark</th>
        <th scope="col">Use for</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <div class="gl-alias-row">
            <span class="gl-alias-chip gl-alias-chip--pair" aria-hidden="true">
              <span style="background: #3f7a4a"></span>
              <span style="background: #72b07c"></span>
            </span>
            <code>--gl-color-success</code>
          </div>
        </td>
        <td><code>#3f7a4a</code></td>
        <td><code>#72b07c</code></td>
        <td>Success text and icons — a completed task's check, a saved-state badge.</td>
      </tr>
      <tr>
        <td>
          <div class="gl-alias-row">
            <span class="gl-alias-chip" aria-hidden="true" style="background: repeating-linear-gradient(45deg, var(--gl-color-surface-fill) 0 4px, var(--gl-color-surface-card) 4px 8px);"></span>
            <code>--gl-color-success-bg</code>
          </div>
        </td>
        <td><code>color-mix(in oklch, var(--gl-color-success) 12%, white)</code></td>
        <td><code>color-mix(in oklch, var(--gl-color-success) 14%, var(--gl-color-surface-card))</code></td>
        <td>Tint behind a success Badge.</td>
      </tr>
      <tr>
        <td>
          <div class="gl-alias-row">
            <span class="gl-alias-chip gl-alias-chip--pair" aria-hidden="true">
              <span style="background: #ad3a2c"></span>
              <span style="background: #e8907f"></span>
            </span>
            <code>--gl-color-danger</code>
          </div>
        </td>
        <td><code>#ad3a2c</code></td>
        <td><code>#e8907f</code></td>
        <td>Overdue/destructive text, the Toast undo action, a danger Button's fill.</td>
      </tr>
      <tr>
        <td>
          <div class="gl-alias-row">
            <span class="gl-alias-chip" aria-hidden="true" style="background: repeating-linear-gradient(45deg, var(--gl-color-surface-fill) 0 4px, var(--gl-color-surface-card) 4px 8px);"></span>
            <code>--gl-color-danger-bg</code>
          </div>
        </td>
        <td><code>color-mix(in oklch, var(--gl-color-danger) 10%, white)</code></td>
        <td><code>color-mix(in oklch, var(--gl-color-danger) 14%, var(--gl-color-surface-card))</code></td>
        <td>Tint behind a danger Badge and an invalid Input or Select.</td>
      </tr>
    </tbody>
  </table>

## Contrast that has to hold

Color is the one part of this system that is not arbitrary: a ratio is a
fact about two colors and a pair of eyes, and it does not care what the
palette wants. The pairings below are fixed facts about the token values
above, computed once with the standard WCAG 2.x relative-luminance formula
and checked by hand rather than by a build-time test.

### Text — 4.5:1 minimum

<p class="gl-muted">WCAG 2.2 SC 1.4.3 (normal-size text). Each pairing is measured on the darkest surface that text actually sits on, so it holds everywhere above it.</p>

  <table>
    <thead>
      <tr>
        <th scope="col">Pairing</th>
        <th scope="col">Where it shows up</th>
        <th scope="col" class="num">Light</th>
        <th scope="col" class="num">Dark</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <span class="gl-alias-row">
            <span class="gl-alias-chip" aria-hidden="true" style="background: #f1f0ed; color: #100f0d; display: grid; place-items: center; font-size: 10px;">Aa</span>
            <code>color-text-primary<br><span class="gl-subtle">on color-surface-page</span></code>
          </span>
        </td>
        <td>Body copy</td>
        <td class="num">16.81</td>
        <td class="num">15.86</td>
      </tr>
      <tr>
        <td>
          <span class="gl-alias-row">
            <span class="gl-alias-chip" aria-hidden="true" style="background: #f1f0ed; color: #5f5d59; display: grid; place-items: center; font-size: 10px;">Aa</span>
            <code>color-text-secondary<br><span class="gl-subtle">on color-surface-page</span></code>
          </span>
        </td>
        <td>Supporting copy</td>
        <td class="num">5.76</td>
        <td class="num">7.26</td>
      </tr>
      <tr>
        <td>
          <span class="gl-alias-row">
            <span class="gl-alias-chip" aria-hidden="true" style="background: #e8e6e2; color: #686662; display: grid; place-items: center; font-size: 10px;">Aa</span>
            <code>color-text-tertiary<br><span class="gl-subtle">on color-surface-fill</span></code>
          </span>
        </td>
        <td>Hints, placeholders, metadata — its darkest backdrop</td>
        <td class="num">4.60</td>
        <td class="num">5.09</td>
      </tr>
      <tr>
        <td>
          <span class="gl-alias-row">
            <span class="gl-alias-chip" aria-hidden="true" style="background: #e8e6e2; color: #3a6a63; display: grid; place-items: center; font-size: 10px;">Aa</span>
            <code>color-accent-text<br><span class="gl-subtle">on color-surface-fill</span></code>
          </span>
        </td>
        <td>Links, on their darkest backdrop</td>
        <td class="num">4.92</td>
        <td class="num">6.87</td>
      </tr>
      <tr>
        <td>
          <span class="gl-alias-row">
            <span class="gl-alias-chip" aria-hidden="true" style="background: #3a6a63; color: #ffffff; display: grid; place-items: center; font-size: 10px;">Aa</span>
            <code>color-accent-fg<br><span class="gl-subtle">on color-accent</span></code>
          </span>
        </td>
        <td>The label on a primary Button</td>
        <td class="num">6.14</td>
        <td class="num">6.14</td>
      </tr>
      <tr>
        <td>
          <span class="gl-alias-row">
            <span class="gl-alias-chip" aria-hidden="true" style="background: #ad3a2c; color: #f1f0ed; display: grid; place-items: center; font-size: 10px;">Aa</span>
            <code>color-surface-page<br><span class="gl-subtle">on color-danger</span></code>
          </span>
        </td>
        <td>The label on a danger Button</td>
        <td class="num">5.39</td>
        <td class="num">8.07</td>
      </tr>
      <tr>
        <td>
          <span class="gl-alias-row">
            <span class="gl-alias-chip" aria-hidden="true" style="background: #fdfdfb; color: #3f7a4a; display: grid; place-items: center; font-size: 10px;">Aa</span>
            <code>color-success<br><span class="gl-subtle">on color-surface-card</span></code>
          </span>
        </td>
        <td>Success text</td>
        <td class="num">5.04</td>
        <td class="num">7.20</td>
      </tr>
      <tr>
        <td>
          <span class="gl-alias-row">
            <span class="gl-alias-chip" aria-hidden="true" style="background: #fdfdfb; color: #ad3a2c; display: grid; place-items: center; font-size: 10px;">Aa</span>
            <code>color-danger<br><span class="gl-subtle">on color-surface-card</span></code>
          </span>
        </td>
        <td>Overdue and destructive text</td>
        <td class="num">6.03</td>
        <td class="num">7.65</td>
      </tr>
      <tr>
        <td>
          <span class="gl-alias-row">
            <span class="gl-alias-chip" aria-hidden="true" style="background: #f9ebe9; color: #100f0d; display: grid; place-items: center; font-size: 10px;">Aa</span>
            <code>color-text-primary<br><span class="gl-subtle">on color-danger-bg</span></code>
          </span>
        </td>
        <td>The value in an invalid Input</td>
        <td class="num">16.50</td>
        <td class="num">12.41</td>
      </tr>
    </tbody>
  </table>

### Controls — 3:1 minimum

<p class="gl-muted">WCAG 2.2 SC 1.4.11 (the boundary of a control, and the focus indicator).</p>

  <table>
    <thead>
      <tr>
        <th scope="col">Pairing</th>
        <th scope="col">Where it shows up</th>
        <th scope="col" class="num">Light</th>
        <th scope="col" class="num">Dark</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <span class="gl-alias-row">
            <span class="gl-alias-chip" aria-hidden="true" style="background: #f1f0ed; box-shadow: inset 0 0 0 2px #888681;"></span>
            <code>color-border-default<br><span class="gl-subtle">on color-surface-page</span></code>
          </span>
        </td>
        <td>The edge of an input, select or switch track — its weakest backdrop</td>
        <td class="num">3.19</td>
        <td class="num">4.30</td>
      </tr>
      <tr>
        <td>
          <span class="gl-alias-row">
            <span class="gl-alias-chip" aria-hidden="true" style="background: #e8e6e2; box-shadow: inset 0 0 0 2px #3a6a63;"></span>
            <code>color-accent-text<br><span class="gl-subtle">on color-surface-fill</span></code>
          </span>
        </td>
        <td>The focus ring and the selected-tab bar, on their darkest backdrop</td>
        <td class="num">4.92</td>
        <td class="num">6.87</td>
      </tr>
    </tbody>
  </table>

<div class="gl-callout">
  <p>
    One thing this contract deliberately does not assert.
    <strong>Hairlines and fills</strong> — <code>--gl-color-border-hairline</code>
    and the surface steps sit well under 3:1 against each other. That's
    deliberate: a bounded surface in this system reads by surface contrast,
    not a border, so hairlines are reserved for dividers inside a surface (a
    CardRow, a table rule) and fills for hover tints, never the only marker
    of a control. Anything a reader has to recognize as a control is drawn
    with <code>--gl-color-border-default</code>, which the table above holds
    to 3:1.
  </p>
</div>

## Rules

- **Never write a hex outside `assets/css/tokens.css`.** If a component
  needs a color that does not exist yet, add the alias.
- **One accent per project, never two in a view.** Swapping `--gl-color-accent`
  re-derives `-text`, `-ink` and `-soft` automatically via `color-mix()`.
- **`--gl-color-success` and `--gl-color-danger` are fixed.** They read the
  same in every project and are never swapped the way the accent is.
