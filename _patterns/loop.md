---
title: "Loop — task dashboard"
summary: >-
  A recurring-task web dashboard. Dense rows, mono meta columns, overdue in
  danger red, one primary action. A generic demonstration of the system, not
  a recreation of any one source project's actual screens.
---

Loop is not a real product — it is the system's own reference layout for a
dense, table-ish list screen: the shape `kejadlen/ketchup` (a recurring-task
tracker) would take if it were rebuilt on this token set. Every visible value
below is a component from this system; nothing here is page-specific CSS
beyond a couple of inline widths.

<figure class="example">
<figcaption>Loop</figcaption>
<div data-layout="stack">
<div style="border: 1px solid var(--ad-color-border-hairline); border-radius: var(--ad-radius-lg); overflow: hidden; background: var(--ad-color-surface-page);">
  <header style="display:flex; align-items:center; gap: var(--ad-space-s); padding: var(--ad-space-s) var(--ad-space-l); border-bottom: 1px solid var(--ad-color-border-hairline);">
    <span style="font-family: var(--ad-font-mono); font-weight:600; letter-spacing:0.02em; font-size: var(--ad-step-0);">Loop</span>
    <div style="flex:1;"></div>
    <button data-variant="primary" data-size="sm">
      <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.9" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M12 5v14M5 12h14" /></svg>
      New
    </button>
    <span class="avatar">km</span>
  </header>
  <div style="display:flex;">
    <div style="flex:1; min-width:0; max-width: 34rem; padding: var(--ad-space-l);">
      <section style="margin-bottom: var(--ad-space-l);">
        <div style="display:flex; align-items:baseline; gap: var(--ad-space-2xs); margin-bottom: var(--ad-space-s);">
          <span class="type-label" style="color: var(--ad-color-danger);">Overdue</span>
          <span class="badge" data-tone="danger">2</span>
        </div>
        <ul class="card" style="border:none; border-radius:0; background:none;">
          <li style="border-top: 1px solid var(--ad-color-border-hairline);">
            <button aria-label="Complete" style="all:unset; width:18px; height:18px; border-radius:4px; flex-shrink:0; cursor:pointer; border: 1.5px solid var(--ad-color-danger);"></button>
            <div style="flex:1; min-width:0;">
              <div style="font-weight:500; color: var(--ad-color-danger);">Call Mom</div>
              <div class="type-mono" style="color: var(--ad-color-text-tertiary); font-size: var(--ad-step--2);">every 2 weeks</div>
            </div>
            <span class="type-mono" style="color: var(--ad-color-danger); font-size: var(--ad-step--2); white-space:nowrap;">3d overdue</span>
          </li>
          <li>
            <button aria-label="Complete" style="all:unset; width:18px; height:18px; border-radius:4px; flex-shrink:0; cursor:pointer; border: 1.5px solid var(--ad-color-danger);"></button>
            <div style="flex:1; min-width:0;">
              <div style="font-weight:500; color: var(--ad-color-danger);">Water the ferns</div>
              <div class="type-mono" style="color: var(--ad-color-text-tertiary); font-size: var(--ad-step--2);">every 5 days</div>
            </div>
            <span class="type-mono" style="color: var(--ad-color-danger); font-size: var(--ad-step--2); white-space:nowrap;">1d overdue</span>
          </li>
        </ul>
      </section>
      <section>
        <div class="type-label" style="margin-bottom: var(--ad-space-s);">Upcoming</div>
        <ul class="card" style="border:none; border-radius:0; background:none;">
          <li style="border-top: 1px solid var(--ad-color-border-hairline);">
            <button aria-label="Complete" style="all:unset; width:18px; height:18px; border-radius:4px; flex-shrink:0; cursor:pointer; border: 1.5px solid var(--ad-color-text-secondary);"></button>
            <div style="flex:1; min-width:0;">
              <div style="font-weight:500;">Renew passport</div>
              <div class="type-mono" style="color: var(--ad-color-text-tertiary); font-size: var(--ad-step--2);">every 10 years</div>
            </div>
            <span class="type-mono" style="color: var(--ad-color-text-secondary); font-size: var(--ad-step--2); white-space:nowrap;">in 3 months</span>
          </li>
          <li>
            <button aria-label="Complete" style="all:unset; width:18px; height:18px; border-radius:4px; flex-shrink:0; cursor:pointer; border: 1.5px solid var(--ad-color-text-secondary);"></button>
            <div style="flex:1; min-width:0;">
              <div style="font-weight:500;">Dentist checkup</div>
              <div class="type-mono" style="color: var(--ad-color-text-tertiary); font-size: var(--ad-step--2);">every 6 months</div>
            </div>
            <span class="type-mono" style="color: var(--ad-color-text-secondary); font-size: var(--ad-step--2); white-space:nowrap;">in 2 weeks</span>
          </li>
          <li>
            <button aria-label="Complete" style="all:unset; width:18px; height:18px; border-radius:4px; flex-shrink:0; cursor:pointer; border: 1.5px solid var(--ad-color-text-secondary);"></button>
            <div style="flex:1; min-width:0;">
              <div style="font-weight:500;">Rotate mattress</div>
              <div class="type-mono" style="color: var(--ad-color-text-tertiary); font-size: var(--ad-step--2);">every 6 months</div>
            </div>
            <span class="type-mono" style="color: var(--ad-color-text-secondary); font-size: var(--ad-step--2); white-space:nowrap;">in 5 weeks</span>
          </li>
        </ul>
      </section>
    </div>
    <aside style="width: 15rem; flex-shrink:0; background: var(--ad-color-surface-fill); border-left: 1px solid var(--ad-color-border-hairline); padding: var(--ad-space-l);">
      <div class="type-label" style="margin-bottom: var(--ad-space-s);">This week</div>
      <div style="display:flex; background: var(--ad-color-surface-card); border: 1px solid var(--ad-color-border-hairline); border-radius: var(--ad-radius-md); overflow:hidden; margin-bottom: var(--ad-space-l);">
                                <div style="flex:1; display:flex; flex-direction:column; align-items:center; gap:4px; padding: 8px 0;  border-right: 1px solid var(--ad-color-border-hairline);">
          <span class="type-mono" style="font-size:9px; color: var(--ad-color-text-tertiary); text-transform:uppercase;">S</span>
          <span style="font-size:13px; font-weight:600; color: var(--ad-color-text-primary);">0</span>
        </div>
                <div style="flex:1; display:flex; flex-direction:column; align-items:center; gap:4px; padding: 8px 0;  border-right: 1px solid var(--ad-color-border-hairline);">
          <span class="type-mono" style="font-size:9px; color: var(--ad-color-text-tertiary); text-transform:uppercase;">M</span>
          <span style="font-size:13px; font-weight:600; color: var(--ad-color-text-primary);">1</span>
        </div>
                <div style="flex:1; display:flex; flex-direction:column; align-items:center; gap:4px; padding: 8px 0;  border-right: 1px solid var(--ad-color-border-hairline);">
          <span class="type-mono" style="font-size:9px; color: var(--ad-color-text-tertiary); text-transform:uppercase;">T</span>
          <span style="font-size:13px; font-weight:600; color: var(--ad-color-text-primary);">0</span>
        </div>
                <div style="flex:1; display:flex; flex-direction:column; align-items:center; gap:4px; padding: 8px 0; background: var(--ad-color-accent-soft); border-right: 1px solid var(--ad-color-border-hairline);">
          <span class="type-mono" style="font-size:9px; color: var(--ad-color-text-tertiary); text-transform:uppercase;">W</span>
          <span style="font-size:13px; font-weight:600; color: var(--ad-color-accent-ink);">2</span>
        </div>
                <div style="flex:1; display:flex; flex-direction:column; align-items:center; gap:4px; padding: 8px 0;  border-right: 1px solid var(--ad-color-border-hairline);">
          <span class="type-mono" style="font-size:9px; color: var(--ad-color-text-tertiary); text-transform:uppercase;">T</span>
          <span style="font-size:13px; font-weight:600; color: var(--ad-color-text-primary);">0</span>
        </div>
                <div style="flex:1; display:flex; flex-direction:column; align-items:center; gap:4px; padding: 8px 0;  border-right: 1px solid var(--ad-color-border-hairline);">
          <span class="type-mono" style="font-size:9px; color: var(--ad-color-text-tertiary); text-transform:uppercase;">F</span>
          <span style="font-size:13px; font-weight:600; color: var(--ad-color-text-primary);">1</span>
        </div>
                <div style="flex:1; display:flex; flex-direction:column; align-items:center; gap:4px; padding: 8px 0;  ">
          <span class="type-mono" style="font-size:9px; color: var(--ad-color-text-tertiary); text-transform:uppercase;">S</span>
          <span style="font-size:13px; font-weight:600; color: var(--ad-color-text-primary);">0</span>
        </div>
              </div>
      <div class="type-label" style="margin-bottom: var(--ad-space-2xs);">Series</div>
      <div>
        <div style="padding: var(--ad-space-2xs) 0; font-size: var(--ad-step--1); color: var(--ad-color-text-secondary);">Call Mom</div>
        <div style="padding: var(--ad-space-2xs) 0; border-top: 1px solid var(--ad-color-border-hairline); font-size: var(--ad-step--1); color: var(--ad-color-text-secondary);">Water the ferns</div>
        <div style="padding: var(--ad-space-2xs) 0; border-top: 1px solid var(--ad-color-border-hairline); font-size: var(--ad-step--1); color: var(--ad-color-text-secondary);">Renew passport</div>
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
      <div style="display:flex; flex-direction:column; gap: var(--ad-space-s);">
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
- **Overdue in `--ad-color-danger`, everywhere at once.** Row text, the
  complete-button border, and the trailing meta all pick it up from the same
  `overdue` state — color never drifts row to row.
- **One primary action.** `New` is the only accent-filled control on screen;
  everything else is neutral or bordered.
- **Accent used exactly once, decoratively.** The "km" avatar and the
  highlighted day both use `--ad-color-accent-soft` / `-ink` — never the raw
  accent fill outside of `New`.
