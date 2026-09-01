---
title: Refusals
permalink: /refusals/
section: Start here
summary: >-
  A consolidated checklist of generated-interface tells this system refuses
  to produce — for auditing a new screen before it ships.
---

Generated interfaces converge on a small set of shapes: the eyebrow over a
headline, the icon tile above a card title, the softly-glowing dark theme.
None of them are accidental omissions here — each is already refused by a
rule on the relevant foundation page. This page exists only to put all of
them in one place, so a new screen can be checked against the whole list at
once instead of five pages in sequence. These are laws, not preferences: a
screen that breaks one is off-system.

## Surface & elevation

- **No cream or beige page.** The stock is warm but held close to neutral —
  see [Color](<%= relative_url('/foundations/color/') %>).
- **No side-accent bar on a card, no four-sided border, no bordered card at
  all.** [Card](<%= relative_url('/components/card/') %>) is a hairline
  border plus `--gl-radius-lg`, nothing else.
- **No hairline border and soft shadow on the same element.** One or the
  other — see [Elevation](<%= relative_url('/foundations/elevation/') %>).
- **No decorative grid, stripe field, or radial glow.** Flat color only.
- **No radius above `--gl-radius-lg` on a card, no custom corner value
  outside the token scale.** `--gl-radius-full` stays reserved for true
  pills — [Switch](<%= relative_url('/components/switch/') %>)'s track and
  thumb, the avatar chip — not a general-purpose corner.
- **No dark theme with colored glows.** Dark mode repoints the same aliases
  at the inverted neutral ramp; nothing else changes.

## Type & hierarchy

- **No kicker or eyebrow above a heading.** A heading is already the top of
  its own hierarchy; stacking a tracked uppercase label over it invents a
  second, redundant one.
- **Uppercase and tracking stay on `type-label`.** Never on body copy, never
  on a heading — see [Typography](<%= relative_url('/foundations/typography/') %>).
- **No gradient text. No italic serif display headline.**
- **Adjacent steps in the type scale are 1.2–1.25 apart — not enough
  contrast on their own.** Skip a step between a heading and the body under
  it, or the hierarchy reads flat.
- **A heading gets more space above it than below it.** The gap says what
  belongs to what.

## Layout & structure

- **No card inside a card.** One level, then spacing and rules do the rest.
- **A grid of cards is fine when each card is a real, distinct object.**
  What's refused is the decorative version — identical icon-and-heading
  cards standing in for a list. Repeated, uniform items belong on a
  [CardRow](<%= relative_url('/components/card-row/') %>) list, not a card
  grid.
- **No icon tile stacked above a heading.** An icon sits beside its label,
  in flow.
- **No decorative numbered section labels.** A number appears only when
  it's real data.

## Motion

- **No pulsing status dot.** Status is [Badge](<%= relative_url('/components/badge/') %>) —
  tone plus mono uppercase text, on no background. It never animates on its
  own; only data that's actually changing does — see
  [Motion](<%= relative_url('/foundations/motion/') %>).
- **No blinking cursor in non-editable copy, no marquee, no bounce or
  elastic easing.**
- **No hover scale on imagery.** Animate `transform` and `opacity`, never
  `width` or `height`.

## Copy

- **At most two em-dashes in a passage.** Commas, colons, and periods carry
  the same joins without the cadence.
- **No "not X, a Y" aphorisms, and no manufactured contrast as a closing
  line.** State the thing once.
- **Nothing gets dismissed as "theater."** Say plainly what a thing does or
  does not do. See the Voice section in `SKILL.md`.
