---
name: design-system
description: Use this skill to build interfaces, pages, or prototypes in the Arbitrary Definitions style — a personal design system for self-hosted, single-user tools. Warm low-chroma neutrals, one swappable accent, IBM Plex Mono labels, and sixteen components built as plain HTML with no CSS class API to memorize. Use whenever a project should look like it came from the same hand as the others in this umbrella.
user-invocable: true
---

Read `README.md` and `rationale.md` in this repo before building anything —
they cover the voice, the visual foundations, and the four hard rules (no
hex or duration outside `tokens.css`, components read aliases not ramps,
every token says what it's for, one accent per project, never two in a
view). `install.md` covers embedding and retheming in more depth than this
file repeats.

## Getting the CSS into another project

Three files, in this order, no build step:

```html
<link rel="stylesheet" href="tokens.css">
<link rel="stylesheet" href="base.css">
<link rel="stylesheet" href="components.css">
```

All three are already the exact files this site deploys:
[`assets/css/tokens.css`](assets/css/tokens.css),
[`assets/css/base.css`](assets/css/base.css),
[`assets/css/components.css`](assets/css/components.css). This site also
deploys `docs.css` and `patterns.css` — its own chrome (the sidebar, the
example-demo boxes, doc tables) and the Loop/Archive pattern-page CSS — but
neither has anything to do with the design system itself, so don't link
them elsewhere.

Load IBM Plex Mono separately — the system's one webfont:

```css
@import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Mono:wght@400;500;600&display=swap');
```

## Writing markup

There is no class API to memorize. Every component has its exact contract
documented in `_components/<name>.md` — **read the specific file for the
component you're about to use before writing its markup**, rather than
guessing from a similar one or from memory:

- Bare elements styled directly: `<button>`, `<input>`, `<select>`, native
  `<dialog>` (with `<header>`/`<footer>` and `::backdrop` — no wrapper
  divs).
- ARIA roles doing double duty as style hooks: `[role="tablist"]`,
  `[role="tab"]`, `[role="tabpanel"]`, `[role="status"]`, `[role="tooltip"]`,
  `[role="switch"]` — these are the correct accessibility attributes
  regardless, so using them as selectors invents nothing.
- `data-*` attributes for variants and states: `data-variant="primary"`,
  `data-size="sm"`, `data-tone="danger"`, `data-elevated`.
- Exactly seven plain, unmodified classes exist, each because there is no
  element or attribute to hang a selector on: `.btn` (an `<a>` acting as a
  button — a bare `a` selector would catch every prose link on the page),
  `.icon-button`, `.badge`, `.tag`, `.card`, `.field`, `.switch` (fallback
  only, for the track/thumb). Never invent an eighth, and never add a `--`
  or `__` modifier to one of these — that convention was deliberately
  removed from this system.

## Voice

Plain, unhurried, never marketing copy. These are tools for one person or
one household — copy never addresses "you" as a customer, and empty states
just state the fact ("Nothing tracked yet."). See README's "The idea" and
`rationale.md`'s "Where the name comes from" for the fuller version.

## Retheming

One accent per project, held constant — swap `--ad-color-accent` after
`tokens.css` loads; `-ink` and `-soft` re-derive automatically via
`color-mix()`. `--ad-color-success` and `--ad-color-danger` are fixed and
never swapped. Re-check contrast after retheming — the system's own
guarantees (see the [Color foundation](foundations/color.md)) are about its
own values, not yours.
