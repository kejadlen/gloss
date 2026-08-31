---
title: "Loop — task dashboard"
summary: >-
  A recurring-task web dashboard. Dense rows, mono meta columns, overdue in
  danger red, one primary action. A generic demonstration of the system, not
  a recreation of any real product's actual screens.
---

Loop is not a real product — it is the system's own reference layout for a
dense, table-ish list screen: the shape a recurring-task tracker would take
if it were rebuilt on this token set. Every visible value below is a
component from this system, composed with real page-specific CSS
(`_sass/site/patterns.css`) rather than inline styles — the same thing an
actual project built on this system would write.

<figure class="example">
<figcaption>Loop</figcaption>
<div data-layout="stack">
<div class="pattern-dashboard">
  <header class="pattern-dashboard__header">
    <span class="pattern-dashboard__title">Loop</span>
    <div class="pattern-spacer"></div>
    <button data-variant="primary" data-size="sm">
      <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.9" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M12 5v14M5 12h14" /></svg>
      New
    </button>
    <span class="avatar">km</span>
  </header>
  <div class="pattern-dashboard__body">
    <div class="pattern-dashboard__main">
      <section class="pattern-section">
        <div class="pattern-section__heading">
          <span class="type-label" style="color: var(--gl-color-danger);">Overdue</span>
          <span class="badge" data-tone="danger">2</span>
        </div>
        <ul class="card pattern-list">
          <li>
            <button class="pattern-complete" data-tone="danger" aria-label="Complete"></button>
            <div class="pattern-row">
              <div class="pattern-row__title" data-tone="danger">Call Mom</div>
              <div class="type-mono pattern-row__meta">every 2 weeks</div>
            </div>
            <span class="type-mono pattern-row__trailing" data-tone="danger">3d overdue</span>
          </li>
          <li>
            <button class="pattern-complete" data-tone="danger" aria-label="Complete"></button>
            <div class="pattern-row">
              <div class="pattern-row__title" data-tone="danger">Water the ferns</div>
              <div class="type-mono pattern-row__meta">every 5 days</div>
            </div>
            <span class="type-mono pattern-row__trailing" data-tone="danger">1d overdue</span>
          </li>
        </ul>
      </section>
      <section class="pattern-section">
        <div class="type-label pattern-aside__label">Upcoming</div>
        <ul class="card pattern-list">
          <li>
            <button class="pattern-complete" aria-label="Complete"></button>
            <div class="pattern-row">
              <div class="pattern-row__title">Renew passport</div>
              <div class="type-mono pattern-row__meta">every 10 years</div>
            </div>
            <span class="type-mono pattern-row__trailing" data-tone="secondary">in 3 months</span>
          </li>
          <li>
            <button class="pattern-complete" aria-label="Complete"></button>
            <div class="pattern-row">
              <div class="pattern-row__title">Dentist checkup</div>
              <div class="type-mono pattern-row__meta">every 6 months</div>
            </div>
            <span class="type-mono pattern-row__trailing" data-tone="secondary">in 2 weeks</span>
          </li>
          <li>
            <button class="pattern-complete" aria-label="Complete"></button>
            <div class="pattern-row">
              <div class="pattern-row__title">Rotate mattress</div>
              <div class="type-mono pattern-row__meta">every 6 months</div>
            </div>
            <span class="type-mono pattern-row__trailing" data-tone="secondary">in 5 weeks</span>
          </li>
        </ul>
      </section>
    </div>
    <aside class="pattern-dashboard__aside">
      <div class="type-label pattern-aside__label">This week</div>
      <div class="pattern-week">
        <div class="pattern-week__day">
          <span class="type-mono pattern-week__label">S</span>
          <span class="pattern-week__value">0</span>
        </div>
        <div class="pattern-week__day">
          <span class="type-mono pattern-week__label">M</span>
          <span class="pattern-week__value">1</span>
        </div>
        <div class="pattern-week__day">
          <span class="type-mono pattern-week__label">T</span>
          <span class="pattern-week__value">0</span>
        </div>
        <div class="pattern-week__day" data-active>
          <span class="type-mono pattern-week__label">W</span>
          <span class="pattern-week__value">2</span>
        </div>
        <div class="pattern-week__day">
          <span class="type-mono pattern-week__label">T</span>
          <span class="pattern-week__value">0</span>
        </div>
        <div class="pattern-week__day">
          <span class="type-mono pattern-week__label">F</span>
          <span class="pattern-week__value">1</span>
        </div>
        <div class="pattern-week__day">
          <span class="type-mono pattern-week__label">S</span>
          <span class="pattern-week__value">0</span>
        </div>
      </div>
      <div class="type-label pattern-aside__label--tight">Series</div>
      <div>
        <div class="pattern-series-item">Call Mom</div>
        <div class="pattern-series-item">Water the ferns</div>
        <div class="pattern-series-item">Renew passport</div>
      </div>
    </aside>
  </div>
</div>
</div>
</figure>

## The New series dialog

<figure class="example">
<figcaption>New series</figcaption>
<div data-layout="stack">
<div class="dialog-demo" style="min-height: 36rem;">
  <dialog open style="width: 22rem;">
    <header>New series</header>
    <div>
      <div class="field-stack">
        <label class="field">
          Note
          <input placeholder="Call Mom" />
          <small>First line becomes the display name.</small>
        </label>
        <div class="form-row">
          <label class="field">
            Every
            <input type="number" placeholder="2" />
          </label>
          <label class="field">
            Unit
            <select><option>Day</option><option selected="">Week</option><option>Month</option><option>Year</option></select>
          </label>
        </div>
      </div>
    </div>
    <footer>
      <button>Cancel</button>
      <button data-variant="primary">Create</button>
    </footer>
  </dialog>
</div>
</div>
</figure>

## After completing a task

<figure class="example">
<figcaption>Toast</figcaption>
<div>
<div role="status">
  <span>Completed "Call Mom"</span>
  <button aria-label="Dismiss">×</button>
</div>
</div>
</figure>

## What this screen is testing

- **Dense rows next to a mono meta column.** A recurring-task list is
  fundamentally tabular even though it never touches an actual `<table>`.
- **Overdue in `--gl-color-danger`, everywhere at once.** Row text, the
  complete-button border, and the trailing meta all pick it up from the same
  `overdue` state — color never drifts row to row.
- **One primary action.** `New` is the only accent-filled control on screen;
  everything else is neutral or bordered.
- **Accent used exactly once, decoratively.** The "km" avatar and the
  highlighted day both use `--gl-color-accent-soft` / `-ink` — never the raw
  accent fill outside of `New`.
