---
title: Color
summary: >-
  Two neutral ramps, five accents, two fixed semantic colors, seventeen
  semantic aliases. Low-chroma warm-gray, never stark white or black.
---

## The two layers

The system separates *what a color is* from *what a color is for*.

The **ramps** below are raw material: ten steps of neutral (light), the same
ten inverted for dark mode, and five accent hues. No component references
them directly.

The **aliases** underneath are the working vocabulary — `--ad-color-text-primary`,
`--ad-color-surface-card`, `--ad-color-accent`. Every component stylesheet
reads from these. Retheming, or switching to dark, means repointing aliases
at different values — which is exactly what the dark block does.

<div class="ad-callout">
  <p style="margin:0; font-size: var(--ad-step--1);">
    The neutral ramps were authored in <code>oklch()</code> by the three
    projects this system was synthesized from (see
    <a href="<%= relative_url('/rationale/') %>">Why arbitrary</a>). Every
    value below is that same color converted to flat sRGB hex — not
    re-picked, not rounded. The contrast figures on this page are computed
    from those hex values with the standard WCAG 2.1 relative-luminance
    formula, then transcribed here as fact rather than typed by eye.
  </p>
</div>

## Neutral

Low-chroma warm-gray — the intersection of ketchup's plain grays, quire's
warm cream/dark palette, and domus's warm paper. Ten steps, not twelve or
sixteen: the source defines exactly these.

<p class="ad-muted">Low-chroma warm-gray — the intersection of ketchup's plain grays, quire's warm cream/dark palette, and domus's warm paper. Not stark white or black, and not any one project's specific warmth. Ten steps, not twelve: the source defines exactly 0/50/100/150/200/300/500/600/800/900 — steps 400 and 700 do not exist.</p>
<ul class="ad-swatch-grid">
  <li class="ad-swatch">
    <div class="ad-swatch__chip" style="background: #faf9f7; color: #171512;">n-0</div>
    <div class="ad-swatch__meta">
      <span class="ad-swatch__hex">#faf9f7</span>
      <span class="ad-swatch__ratio">1.05 on white</span>
    </div>
  </li>
  <li class="ad-swatch">
    <div class="ad-swatch__chip" style="background: #fdfdfb; color: #171512;">n-50</div>
    <div class="ad-swatch__meta">
      <span class="ad-swatch__hex">#fdfdfb</span>
      <span class="ad-swatch__ratio">1.02 on white</span>
    </div>
  </li>
  <li class="ad-swatch">
    <div class="ad-swatch__chip" style="background: #f1f0ed; color: #171512;">n-100</div>
    <div class="ad-swatch__meta">
      <span class="ad-swatch__hex">#f1f0ed</span>
      <span class="ad-swatch__ratio">1.14 on white</span>
    </div>
  </li>
  <li class="ad-swatch">
    <div class="ad-swatch__chip" style="background: #e8e6e2; color: #171512;">n-150</div>
    <div class="ad-swatch__meta">
      <span class="ad-swatch__hex">#e8e6e2</span>
      <span class="ad-swatch__ratio">1.25 on white</span>
    </div>
  </li>
  <li class="ad-swatch">
    <div class="ad-swatch__chip" style="background: #dcdad7; color: #171512;">n-200</div>
    <div class="ad-swatch__meta">
      <span class="ad-swatch__hex">#dcdad7</span>
      <span class="ad-swatch__ratio">1.40 on white</span>
    </div>
  </li>
  <li class="ad-swatch">
    <div class="ad-swatch__chip" style="background: #c0bdb9; color: #171512;">n-300</div>
    <div class="ad-swatch__meta">
      <span class="ad-swatch__hex">#c0bdb9</span>
      <span class="ad-swatch__ratio">1.87 on white</span>
    </div>
  </li>
  <li class="ad-swatch">
    <div class="ad-swatch__chip" style="background: #888681; color: #171512;">n-500</div>
    <div class="ad-swatch__meta">
      <span class="ad-swatch__hex">#888681</span>
      <span class="ad-swatch__ratio">3.64 on white</span>
    </div>
  </li>
  <li class="ad-swatch">
    <div class="ad-swatch__chip" style="background: #5f5d59; color: #ffffff;">n-600</div>
    <div class="ad-swatch__meta">
      <span class="ad-swatch__hex">#5f5d59</span>
      <span class="ad-swatch__ratio">6.57 on white</span>
    </div>
  </li>
  <li class="ad-swatch">
    <div class="ad-swatch__chip" style="background: #2a2926; color: #ffffff;">n-800</div>
    <div class="ad-swatch__meta">
      <span class="ad-swatch__hex">#2a2926</span>
      <span class="ad-swatch__ratio">14.55 on white</span>
    </div>
  </li>
  <li class="ad-swatch">
    <div class="ad-swatch__chip" style="background: #100f0d; color: #ffffff;">n-900</div>
    <div class="ad-swatch__meta">
      <span class="ad-swatch__hex">#100f0d</span>
      <span class="ad-swatch__ratio">19.16 on white</span>
    </div>
  </li>
</ul>

<p class="ad-muted">The same low-chroma warm-gray scale, inverted, matching quire's OS-preference dark palette. Same ten step numbers as `neutral`; `0` is the darkest step here (the dark-theme page background) rather than the lightest.</p>
<ul class="ad-swatch-grid">
  <li class="ad-swatch">
    <div class="ad-swatch__chip" style="background: #0e0d0b; color: #ffffff;">nd-0</div>
    <div class="ad-swatch__meta">
      <span class="ad-swatch__hex">#0e0d0b</span>
      <span class="ad-swatch__ratio">1.08 on black</span>
    </div>
  </li>
  <li class="ad-swatch">
    <div class="ad-swatch__chip" style="background: #151412; color: #ffffff;">nd-50</div>
    <div class="ad-swatch__meta">
      <span class="ad-swatch__hex">#151412</span>
      <span class="ad-swatch__ratio">1.14 on black</span>
    </div>
  </li>
  <li class="ad-swatch">
    <div class="ad-swatch__chip" style="background: #1e1d1a; color: #ffffff;">nd-100</div>
    <div class="ad-swatch__meta">
      <span class="ad-swatch__hex">#1e1d1a</span>
      <span class="ad-swatch__ratio">1.25 on black</span>
    </div>
  </li>
  <li class="ad-swatch">
    <div class="ad-swatch__chip" style="background: #252421; color: #ffffff;">nd-150</div>
    <div class="ad-swatch__meta">
      <span class="ad-swatch__hex">#252421</span>
      <span class="ad-swatch__ratio">1.35 on black</span>
    </div>
  </li>
  <li class="ad-swatch">
    <div class="ad-swatch__chip" style="background: #2c2b29; color: #ffffff;">nd-200</div>
    <div class="ad-swatch__meta">
      <span class="ad-swatch__hex">#2c2b29</span>
      <span class="ad-swatch__ratio">1.48 on black</span>
    </div>
  </li>
  <li class="ad-swatch">
    <div class="ad-swatch__chip" style="background: #44423f; color: #ffffff;">nd-300</div>
    <div class="ad-swatch__meta">
      <span class="ad-swatch__hex">#44423f</span>
      <span class="ad-swatch__ratio">2.10 on black</span>
    </div>
  </li>
  <li class="ad-swatch">
    <div class="ad-swatch__chip" style="background: #7c7a76; color: #ffffff;">nd-500</div>
    <div class="ad-swatch__meta">
      <span class="ad-swatch__hex">#7c7a76</span>
      <span class="ad-swatch__ratio">4.90 on black</span>
    </div>
  </li>
  <li class="ad-swatch">
    <div class="ad-swatch__chip" style="background: #a09e9a; color: #171512;">nd-600</div>
    <div class="ad-swatch__meta">
      <span class="ad-swatch__hex">#a09e9a</span>
      <span class="ad-swatch__ratio">7.85 on black</span>
    </div>
  </li>
  <li class="ad-swatch">
    <div class="ad-swatch__chip" style="background: #d9d7d4; color: #171512;">nd-800</div>
    <div class="ad-swatch__meta">
      <span class="ad-swatch__hex">#d9d7d4</span>
      <span class="ad-swatch__ratio">14.62 on black</span>
    </div>
  </li>
  <li class="ad-swatch">
    <div class="ad-swatch__chip" style="background: #e9e8e6; color: #171512;">nd-900</div>
    <div class="ad-swatch__meta">
      <span class="ad-swatch__hex">#e9e8e6</span>
      <span class="ad-swatch__ratio">17.15 on black</span>
    </div>
  </li>
</ul>

## Accent

One swappable accent per project — never two in the same view. Signal Teal is
the default; the other four are the sanctioned menu a project can switch to.

<ul class="ad-accent-grid">
  <li>
    <div class="ad-accent-demo" style="background: #3a6a63;">teal (default)</div>
    <div class="ad-specimen__meta"><span class="ad-token-name">#3a6a63</span><span>6.14:1 on white</span></div>
    <p class="ad-muted" style="font-size: var(--ad-step--2); margin: var(--ad-space-3xs) 0 0;">Default. Neutral, technical.</p>
  </li>
  <li>
    <div class="ad-accent-demo" style="background: #9a5a3c;">clay</div>
    <div class="ad-specimen__meta"><span class="ad-token-name">#9a5a3c</span><span>5.38:1 on white</span></div>
    <p class="ad-muted" style="font-size: var(--ad-step--2); margin: var(--ad-space-3xs) 0 0;">Warm, archival — domus's flavor.</p>
  </li>
  <li>
    <div class="ad-accent-demo" style="background: #2b4a78;">ink-blue</div>
    <div class="ad-specimen__meta"><span class="ad-token-name">#2b4a78</span><span>8.92:1 on white</span></div>
    <p class="ad-muted" style="font-size: var(--ad-step--2); margin: var(--ad-space-3xs) 0 0;">Sober, utilitarian.</p>
  </li>
  <li>
    <div class="ad-accent-demo" style="background: #93701f;">ochre</div>
    <div class="ad-specimen__meta"><span class="ad-token-name">#93701f</span><span>4.59:1 on white</span></div>
    <p class="ad-muted" style="font-size: var(--ad-step--2); margin: var(--ad-space-3xs) 0 0;">Dry, papery.</p>
  </li>
  <li>
    <div class="ad-accent-demo" style="background: #6a3a5c;">plum</div>
    <div class="ad-specimen__meta"><span class="ad-token-name">#6a3a5c</span><span>8.85:1 on white</span></div>
    <p class="ad-muted" style="font-size: var(--ad-step--2); margin: var(--ad-space-3xs) 0 0;">Quiet, personal.</p>
  </li>
</ul>

<div class="ad-callout">
  <p style="margin:0; font-size: var(--ad-step--1);">
    All five clear AA (4.5:1) for white text at their own value, but Ochre is
    the tightest of the five at roughly 4.6:1 — closer to the floor than the
    others (Ink Blue and Plum both clear 8.5:1). That is a real property of a
    dry, papery ochre and is not being rounded away; a project choosing Ochre
    as its accent should re-check any place it sets small white text directly
    on the accent fill, rather than through <code>--ad-color-accent-fg</code>
    on a full-size Button.
  </p>
</div>

## Semantic aliases

Both themes, side by side. The left half of each chip is the light value and
the right half is the dark one.

### Surfaces

<p class="ad-muted">Backgrounds, from the page itself up to a card sitting on it.</p>

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
      <tr>
        <td>
          <div class="ad-alias-row">
            <span class="ad-alias-chip ad-alias-chip--pair" aria-hidden="true">
              <span style="background: #faf9f7"></span>
              <span style="background: #0e0d0b"></span>
            </span>
            <span class="ad-token-name">--ad-color-surface-page</span>
          </div>
        </td>
        <td class="ad-table__code">neutral.0</td>
        <td class="ad-table__code">neutral_dark.0</td>
        <td>The page itself. Nothing sits behind it.</td>
      </tr>
      <tr>
        <td>
          <div class="ad-alias-row">
            <span class="ad-alias-chip ad-alias-chip--pair" aria-hidden="true">
              <span style="background: #fdfdfb"></span>
              <span style="background: #151412"></span>
            </span>
            <span class="ad-token-name">--ad-color-surface-card</span>
          </div>
        </td>
        <td class="ad-table__code">neutral.50</td>
        <td class="ad-table__code">neutral_dark.50</td>
        <td>Cards, dialogs, toasts — anything that reads as a sheet on the page.</td>
      </tr>
      <tr>
        <td>
          <div class="ad-alias-row">
            <span class="ad-alias-chip ad-alias-chip--pair" aria-hidden="true">
              <span style="background: #f1f0ed"></span>
              <span style="background: #1e1d1a"></span>
            </span>
            <span class="ad-token-name">--ad-color-surface-fill</span>
          </div>
        </td>
        <td class="ad-table__code">neutral.100</td>
        <td class="ad-table__code">neutral_dark.100</td>
        <td>Recessed fill — a hovered row, a segmented-tab track, a photo placeholder.</td>
      </tr>
      <tr>
        <td>
          <div class="ad-alias-row">
            <span class="ad-alias-chip ad-alias-chip--pair" aria-hidden="true">
              <span style="background: #e8e6e2"></span>
              <span style="background: #252421"></span>
            </span>
            <span class="ad-token-name">--ad-color-surface-fill-2</span>
          </div>
        </td>
        <td class="ad-table__code">neutral.150</td>
        <td class="ad-table__code">neutral_dark.150</td>
        <td>A second, deeper fill step — the diagonal-grain stripe inside an empty photo slot.</td>
      </tr>
    </tbody>
  </table>
</div>

### Borders

<p class="ad-muted">Two weights. Hairlines do most of the elevation work in this system, so there was never a reason for a third.</p>

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
      <tr>
        <td>
          <div class="ad-alias-row">
            <span class="ad-alias-chip ad-alias-chip--pair" aria-hidden="true">
              <span style="background: #dcdad7"></span>
              <span style="background: #2c2b29"></span>
            </span>
            <span class="ad-token-name">--ad-color-border-hairline</span>
          </div>
        </td>
        <td class="ad-table__code">neutral.200</td>
        <td class="ad-table__code">neutral_dark.200</td>
        <td>Card edges, row dividers, dialog dividers. The default edge everywhere.</td>
      </tr>
      <tr>
        <td>
          <div class="ad-alias-row">
            <span class="ad-alias-chip ad-alias-chip--pair" aria-hidden="true">
              <span style="background: #c0bdb9"></span>
              <span style="background: #44423f"></span>
            </span>
            <span class="ad-token-name">--ad-color-border-default</span>
          </div>
        </td>
        <td class="ad-table__code">neutral.300</td>
        <td class="ad-table__code">neutral_dark.300</td>
        <td>Input and button borders — anything a reader has to recognize as a control.</td>
      </tr>
    </tbody>
  </table>
</div>

### Text

<p class="ad-muted">Three levels of emphasis, deliberately not four. Past three, a reader stops perceiving a hierarchy and starts perceiving noise.</p>

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
      <tr>
        <td>
          <div class="ad-alias-row">
            <span class="ad-alias-chip ad-alias-chip--pair" aria-hidden="true">
              <span style="background: #100f0d"></span>
              <span style="background: #e9e8e6"></span>
            </span>
            <span class="ad-token-name">--ad-color-text-primary</span>
          </div>
        </td>
        <td class="ad-table__code">neutral.900</td>
        <td class="ad-table__code">neutral_dark.900</td>
        <td>Body copy, headings, and every control label.</td>
      </tr>
      <tr>
        <td>
          <div class="ad-alias-row">
            <span class="ad-alias-chip ad-alias-chip--pair" aria-hidden="true">
              <span style="background: #5f5d59"></span>
              <span style="background: #a09e9a"></span>
            </span>
            <span class="ad-token-name">--ad-color-text-secondary</span>
          </div>
        </td>
        <td class="ad-table__code">neutral.600</td>
        <td class="ad-table__code">neutral_dark.600</td>
        <td>Supporting copy, hints, mono meta values, type-label's color.</td>
      </tr>
      <tr>
        <td>
          <div class="ad-alias-row">
            <span class="ad-alias-chip ad-alias-chip--pair" aria-hidden="true">
              <span style="background: #888681"></span>
              <span style="background: #7c7a76"></span>
            </span>
            <span class="ad-token-name">--ad-color-text-tertiary</span>
          </div>
        </td>
        <td class="ad-table__code">neutral.500</td>
        <td class="ad-table__code">neutral_dark.500</td>
        <td>Placeholders and de-emphasized metadata only — never body text. This step is intentionally sub-AA against the page; see the caveat on the Color page.</td>
      </tr>
    </tbody>
  </table>
</div>

### Accent

<p class="ad-muted">One swappable accent per project, held constant across a whole view. `-ink` and `-soft` re-derive from `--ad-color-accent` via `color-mix()` exactly as the source computes them, so retheming the accent retones both automatically.</p>

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
      <tr>
        <td>
          <div class="ad-alias-row">
            <span class="ad-alias-chip ad-alias-chip--pair" aria-hidden="true">
              <span style="background: #3a6a63"></span>
              <span style="background: #3a6a63"></span>
            </span>
            <span class="ad-token-name">--ad-color-accent</span>
          </div>
        </td>
        <td class="ad-table__code">accent.teal</td>
        <td class="ad-table__code">accent.teal</td>
        <td>Primary buttons, links, focus affordance, the active tab underline. Never two accents in one view.</td>
      </tr>
      <tr>
        <td>
          <div class="ad-alias-row">
            <span class="ad-alias-chip ad-alias-chip--pair" aria-hidden="true">
              <span style="background: #ffffff"></span>
              <span style="background: #ffffff"></span>
            </span>
            <span class="ad-token-name">--ad-color-accent-fg</span>
          </div>
        </td>
        <td class="ad-table__code">#ffffff</td>
        <td class="ad-table__code">#ffffff</td>
        <td>Label and icon color on a filled accent surface. Fixed white, not a ramp reference.</td>
      </tr>
      <tr>
        <td>
          <div class="ad-alias-row">
            <span class="ad-alias-chip" aria-hidden="true" style="background: repeating-linear-gradient(45deg, var(--ad-color-surface-fill) 0 4px, var(--ad-color-surface-card) 4px 8px);"></span>
            <span class="ad-token-name">--ad-color-accent-ink</span>
          </div>
        </td>
        <td class="ad-table__code">color-mix(in oklch, var(--ad-color-accent) 78%, black)</td>
        <td class="ad-table__code">color-mix(in oklch, var(--ad-color-accent) 78%, black)</td>
        <td>Text sitting on an `-soft` accent tint — an IconButton's active state, an accent avatar's initials.</td>
      </tr>
      <tr>
        <td>
          <div class="ad-alias-row">
            <span class="ad-alias-chip" aria-hidden="true" style="background: repeating-linear-gradient(45deg, var(--ad-color-surface-fill) 0 4px, var(--ad-color-surface-card) 4px 8px);"></span>
            <span class="ad-token-name">--ad-color-accent-soft</span>
          </div>
        </td>
        <td class="ad-table__code">color-mix(in oklch, var(--ad-color-accent) 12%, white)</td>
        <td class="ad-table__code">color-mix(in oklch, var(--ad-color-accent) 12%, white)</td>
        <td>The tint behind an accent Badge, a toggled IconButton, an accent avatar chip.</td>
      </tr>
    </tbody>
  </table>
</div>

### Status

<p class="ad-muted">Exactly two states, both fixed — they read the same in every project and are never swapped the way the accent is.</p>

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
      <tr>
        <td>
          <div class="ad-alias-row">
            <span class="ad-alias-chip ad-alias-chip--pair" aria-hidden="true">
              <span style="background: #3f7a4a"></span>
              <span style="background: #3f7a4a"></span>
            </span>
            <span class="ad-token-name">--ad-color-success</span>
          </div>
        </td>
        <td class="ad-table__code">#3f7a4a</td>
        <td class="ad-table__code">#3f7a4a</td>
        <td>Success text and icons — a completed task's check, a saved-state badge.</td>
      </tr>
      <tr>
        <td>
          <div class="ad-alias-row">
            <span class="ad-alias-chip" aria-hidden="true" style="background: repeating-linear-gradient(45deg, var(--ad-color-surface-fill) 0 4px, var(--ad-color-surface-card) 4px 8px);"></span>
            <span class="ad-token-name">--ad-color-success-bg</span>
          </div>
        </td>
        <td class="ad-table__code">color-mix(in oklch, var(--ad-color-success) 12%, white)</td>
        <td class="ad-table__code">color-mix(in oklch, var(--ad-color-success) 12%, white)</td>
        <td>Tint behind a success Badge. Mixed against literal white, so it stays constant across themes.</td>
      </tr>
      <tr>
        <td>
          <div class="ad-alias-row">
            <span class="ad-alias-chip ad-alias-chip--pair" aria-hidden="true">
              <span style="background: #ad3a2c"></span>
              <span style="background: #ad3a2c"></span>
            </span>
            <span class="ad-token-name">--ad-color-danger</span>
          </div>
        </td>
        <td class="ad-table__code">#ad3a2c</td>
        <td class="ad-table__code">#ad3a2c</td>
        <td>Overdue/destructive text, the Toast undo action, a danger Button's fill.</td>
      </tr>
      <tr>
        <td>
          <div class="ad-alias-row">
            <span class="ad-alias-chip" aria-hidden="true" style="background: repeating-linear-gradient(45deg, var(--ad-color-surface-fill) 0 4px, var(--ad-color-surface-card) 4px 8px);"></span>
            <span class="ad-token-name">--ad-color-danger-bg</span>
          </div>
        </td>
        <td class="ad-table__code">color-mix(in oklch, var(--ad-color-danger) 10%, white)</td>
        <td class="ad-table__code">color-mix(in oklch, var(--ad-color-danger) 10%, white)</td>
        <td>Tint behind a danger Badge. Mixed against literal white, so it stays constant across themes.</td>
      </tr>
    </tbody>
  </table>
</div>

## Contrast that has to hold

Color is the one part of this system that is not arbitrary: a ratio is a
fact about two colors and a pair of eyes, and it does not care what the
palette wants. The pairings below are fixed facts about the token values
above, computed once with the standard WCAG 2.1 relative-luminance formula
and checked by hand rather than by a build-time test.

### Text — 4.5:1 minimum

<p class="ad-muted">WCAG 2.1 SC 1.4.3 (normal-size text)</p>

<div class="ad-table-wrap">
  <table class="ad-table ad-table--compact">
    <thead>
      <tr>
        <th scope="col">Pairing</th>
        <th scope="col">Where it shows up</th>
        <th scope="col" class="ad-table__num">Light</th>
        <th scope="col" class="ad-table__num">Dark</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <span class="ad-alias-row">
            <span class="ad-alias-chip" aria-hidden="true" style="background: #faf9f7; color: #100f0d; display: grid; place-items: center; font-size: 10px;">Aa</span>
            <span class="ad-token-name">color-text-primary<br><span class="ad-subtle">on color-surface-page</span></span>
          </span>
        </td>
        <td>Body copy</td>
        <td class="ad-table__num">18.21</td>
        <td class="ad-table__num">15.86</td>
      </tr>
      <tr>
        <td>
          <span class="ad-alias-row">
            <span class="ad-alias-chip" aria-hidden="true" style="background: #faf9f7; color: #5f5d59; display: grid; place-items: center; font-size: 10px;">Aa</span>
            <span class="ad-token-name">color-text-secondary<br><span class="ad-subtle">on color-surface-page</span></span>
          </span>
        </td>
        <td>Supporting copy</td>
        <td class="ad-table__num">6.24</td>
        <td class="ad-table__num">7.26</td>
      </tr>
      <tr>
        <td>
          <span class="ad-alias-row">
            <span class="ad-alias-chip" aria-hidden="true" style="background: #3a6a63; color: #ffffff; display: grid; place-items: center; font-size: 10px;">Aa</span>
            <span class="ad-token-name">color-accent-fg<br><span class="ad-subtle">on color-accent</span></span>
          </span>
        </td>
        <td>The label on a primary or dark-variant Button.</td>
        <td class="ad-table__num">6.14</td>
        <td class="ad-table__num">6.14</td>
      </tr>
      <tr>
        <td>
          <span class="ad-alias-row">
            <span class="ad-alias-chip" aria-hidden="true" style="background: #ffffff; color: #3f7a4a; display: grid; place-items: center; font-size: 10px;">Aa</span>
            <span class="ad-token-name">color-success<br><span class="ad-subtle">on color-accent-fg</span></span>
          </span>
        </td>
        <td>Success text on a light backdrop — proxied by color-accent-fg</td>
        <td class="ad-table__num">5.13</td>
        <td class="ad-table__num">5.13</td>
      </tr>
      <tr>
        <td>
          <span class="ad-alias-row">
            <span class="ad-alias-chip" aria-hidden="true" style="background: #ffffff; color: #ad3a2c; display: grid; place-items: center; font-size: 10px;">Aa</span>
            <span class="ad-token-name">color-danger<br><span class="ad-subtle">on color-accent-fg</span></span>
          </span>
        </td>
        <td>Overdue/destructive text on a light backdrop</td>
        <td class="ad-table__num">6.14</td>
        <td class="ad-table__num">6.14</td>
      </tr>
    </tbody>
  </table>
</div>

<div class="ad-callout">
  <p style="margin:0; font-size: var(--ad-step--1);">
    Two things this contract deliberately does not assert.
    <strong>Text tertiary</strong> — <code>--ad-color-text-tertiary</code>
    (neutral.500) is roughly 3.46:1 against the page in light mode, under the
    4.5:1 floor. The source documents that step as muted-faint text —
    placeholders and de-emphasized metadata, never body copy — so this is a
    real, intentional property of the palette, not a bug to patch by
    darkening the step.
    <strong>Borders</strong> — <code>--ad-color-border-hairline</code> and
    <code>--ad-color-border-default</code> sit well under the 3:1 that WCAG
    1.4.11 asks of a meaningful boundary. The source's own words are
    "hairline (1px) borders and dividers do most of the elevation work" —
    borders here are deliberately quiet, and the source never claims a 3:1
    bar for them, so this contract does not invent one.
  </p>
</div>

## Rules

- **Never write a hex outside `assets/css/tokens.css`.** If a component
  needs a color that does not exist yet, add the alias.
- **One accent per project, never two in a view.** Swapping `--ad-color-accent`
  re-derives `-ink` and `-soft` automatically via `color-mix()`.
- **`--ad-color-success` and `--ad-color-danger` are fixed.** They read the
  same in every project and are never swapped the way the accent is.
