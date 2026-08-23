---
title: "Archive — capture app"
summary: >-
  A capture/document mobile app. Card list, bottom capture dock, photo slots
  with the diagonal-grain empty state. A generic demonstration of the system,
  not a recreation of any real product's actual screens.
---

Archive is not a real product — it is the system's own reference layout for a
mobile capture flow: the shape a household inventory and document archive
app would take if it were rebuilt on this token set, at its 390×760 frame.
Three screens, abbreviated to what each one adds.

<figure class="example">
<figcaption>Home — recent captures</figcaption>
<div>
<div class="pattern-phone">
  <header class="pattern-phone__header">
    <span class="pattern-phone__brand">Archive</span>
  </header>
  <div class="pattern-phone__body pattern-phone__body--dock">
    <div class="pattern-list-heading">
      <span class="pattern-list-heading__title">Recent</span>
      <span class="type-label">3 tracked</span>
    </div>
    <ul class="card">
      <li>
        <span class="avatar" data-square><svg width="17" height="17" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M21 8 12 3 3 8v8l9 5 9-5V8Z" /><path d="M3 8l9 5 9-5M12 13v8" /></svg></span>
        <div class="pattern-row">
          <div class="pattern-file-title pattern-file-title--truncate">Dishwasher manual</div>
          <div class="type-label pattern-file-meta">PDF · 2.1MB</div>
        </div>
        <span class="type-mono pattern-row__meta">2h</span>
      </li>
      <li>
        <span class="avatar" data-square><svg width="17" height="17" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M21 8 12 3 3 8v8l9 5 9-5V8Z" /><path d="M3 8l9 5 9-5M12 13v8" /></svg></span>
        <div class="pattern-row">
          <div class="pattern-file-title">Sofa receipt</div>
          <div class="type-label pattern-file-meta">JPG · 640KB</div>
        </div>
        <span class="type-mono pattern-row__meta">1d</span>
      </li>
      <li>
        <span class="avatar" data-square><svg width="17" height="17" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M21 8 12 3 3 8v8l9 5 9-5V8Z" /><path d="M3 8l9 5 9-5M12 13v8" /></svg></span>
        <div class="pattern-row">
          <div class="pattern-file-title">Passport scan</div>
          <div class="type-label pattern-file-meta">PDF · 890KB</div>
        </div>
        <span class="type-mono pattern-row__meta">4d</span>
      </li>
    </ul>
  </div>
  <div class="pattern-dock">
    <button data-variant="primary" data-size="lg" data-block>
      <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M3 8a2 2 0 0 1 2-2h1.5l1-1.5h9l1 1.5H20a2 2 0 0 1 2 2v10a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V8Z" /><circle cx="12" cy="13" r="3.5" /></svg>
      Take a photo
    </button>
  </div>
</div>
<div class="pattern-phone">
  <header class="pattern-phone__header">
    <button class="icon-button" data-size="sm" aria-label="Back"><svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.9" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M15 18l-6-6 6-6" /></svg></button>
    <span class="pattern-phone__title">Save</span>
  </header>
  <div class="pattern-phone__body">
    <div class="pattern-photo-slot">
      <svg width="17" height="17" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M21 8 12 3 3 8v8l9 5 9-5V8Z" /><path d="M3 8l9 5 9-5M12 13v8" /></svg>
      <span class="type-label">Photo preview</span>
    </div>
    <label class="field" style="margin-top: var(--ad-space-m);">
      Name
      <input placeholder="Dishwasher manual" />
    </label>
  </div>
  <div class="pattern-phone__footer">
    <button>Retake</button>
    <button data-variant="primary">Save</button>
  </div>
</div>
<div class="pattern-phone">
  <header class="pattern-phone__header">
    <button class="icon-button" data-size="sm" aria-label="Back"><svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.9" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M15 18l-6-6 6-6" /></svg></button>
    <span class="type-label">Archive</span>
  </header>
  <div class="pattern-phone__body">
    <h1 class="pattern-detail-title">Dishwasher manual</h1>
    <div class="pattern-tag-row">
      <span class="tag">location:kitchen</span>
      <span class="tag" data-dashed>+ add tag</span>
    </div>
    <div class="type-label pattern-aside__label--tight">File</div>
    <ul class="card">
      <li>
        <span class="avatar" data-square><svg width="17" height="17" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M21 8 12 3 3 8v8l9 5 9-5V8Z" /><path d="M3 8l9 5 9-5M12 13v8" /></svg></span>
        <div class="pattern-row" style="font-size: var(--ad-step--1);">PDF · 2.1MB</div>
      </li>
    </ul>
    <div class="type-label" style="margin: var(--ad-space-m) 0 var(--ad-space-2xs);">Notes</div>
    <p style="font-size: var(--ad-step--1); color: var(--ad-color-text-secondary); line-height:1.55; margin:0;">No notes yet.</p>
  </div>
</div>
</div>
</figure>

## What this screen is testing

- **The diagonal-grain empty state.** The only patterned background this
  system permits, used only inside an empty photo slot.
- **CardRow as a file row, twice.** The same component holds a scannable
  list on Home and a single, focused row on Detail — no special "detail row"
  variant needed.
- **Tag alongside its own dashed "add" affordance.** The two live in one row,
  reading as one continuous, extendable list.
- **`type-label` as the workhorse.** File size, tag count, and the back-button
  screen name all reach for the same mono catalog-label convention as Badge.
