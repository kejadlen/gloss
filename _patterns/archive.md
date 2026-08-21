---
title: "Archive — capture app"
summary: >-
  A capture/document mobile app. Card list, bottom capture dock, photo slots
  with the diagonal-grain empty state. A generic demonstration of the system,
  not a recreation of any one source project's actual screens.
---

Archive is not a real product — it is the system's own reference layout for a
mobile capture flow: the shape `kejadlen/domus` (a household inventory and
document archive) would take if it were rebuilt on this token set, at its
390×760 frame. Three screens, abbreviated to what each one adds.

<figure class="example">
<figcaption>Home — recent captures</figcaption>
<div>
<div style="width: 300px; height: 560px; background: var(--ad-color-surface-page); border-radius: var(--ad-radius-lg); box-shadow: var(--ad-shadow-float); overflow:hidden; display:flex; flex-direction:column; position:relative;">
  <header style="padding: 16px var(--ad-space-m) var(--ad-space-2xs);">
    <span style="font-weight:600; font-size: var(--ad-step-1); letter-spacing:-0.01em;">Archive</span>
  </header>
  <div style="flex:1; overflow:hidden; padding: 0 var(--ad-space-m);">
    <div style="display:flex; align-items:baseline; gap:8px; margin: var(--ad-space-s) 0 var(--ad-space-xs);">
      <span style="font-weight:700; font-size: var(--ad-step-0);">Recent</span>
      <span class="type-label" style="margin-left:auto;">3 tracked</span>
    </div>
    <ul class="card">
      <li>
        <span class="avatar" data-square><svg width="17" height="17" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M21 8 12 3 3 8v8l9 5 9-5V8Z" /><path d="M3 8l9 5 9-5M12 13v8" /></svg></span>
        <div style="flex:1; min-width:0;">
          <div style="font-weight:550; font-size: var(--ad-step--1); white-space:nowrap; overflow:hidden; text-overflow:ellipsis;">Dishwasher manual</div>
          <div class="type-label" style="margin-top:2px;">PDF · 2.1MB</div>
        </div>
        <span class="type-mono" style="color: var(--ad-color-text-tertiary); font-size: var(--ad-step--2);">2h</span>
      </li>
      <li>
        <span class="avatar" data-square><svg width="17" height="17" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M21 8 12 3 3 8v8l9 5 9-5V8Z" /><path d="M3 8l9 5 9-5M12 13v8" /></svg></span>
        <div style="flex:1; min-width:0;">
          <div style="font-weight:550; font-size: var(--ad-step--1);">Sofa receipt</div>
          <div class="type-label" style="margin-top:2px;">JPG · 640KB</div>
        </div>
        <span class="type-mono" style="color: var(--ad-color-text-tertiary); font-size: var(--ad-step--2);">1d</span>
      </li>
      <li>
        <span class="avatar" data-square><svg width="17" height="17" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M21 8 12 3 3 8v8l9 5 9-5V8Z" /><path d="M3 8l9 5 9-5M12 13v8" /></svg></span>
        <div style="flex:1; min-width:0;">
          <div style="font-weight:550; font-size: var(--ad-step--1);">Passport scan</div>
          <div class="type-label" style="margin-top:2px;">PDF · 890KB</div>
        </div>
        <span class="type-mono" style="color: var(--ad-color-text-tertiary); font-size: var(--ad-step--2);">4d</span>
      </li>
    </ul>
  </div>
  <div style="position:absolute; left:0; right:0; bottom:0; display:flex; justify-content:center; padding: 14px 20px 22px; background: linear-gradient(to top, var(--ad-color-surface-page) 65%, transparent);">
    <button type="button" data-variant="primary" data-size="lg" data-block>
      <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M3 8a2 2 0 0 1 2-2h1.5l1-1.5h9l1 1.5H20a2 2 0 0 1 2 2v10a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V8Z" /><circle cx="12" cy="13" r="3.5" /></svg>
      Take a photo
    </button>
  </div>
</div>
<div style="width: 300px; height: 560px; background: var(--ad-color-surface-page); border-radius: var(--ad-radius-lg); box-shadow: var(--ad-shadow-float); overflow:hidden; display:flex; flex-direction:column;">
  <header style="display:flex; align-items:center; gap:8px; padding: 16px var(--ad-space-m) var(--ad-space-2xs);">
    <button type="button" class="icon-button" data-size="sm" aria-label="Back"><svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.9" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M15 18l-6-6 6-6" /></svg></button>
    <span style="font-weight:600; font-size: var(--ad-step-0);">Save</span>
  </header>
  <div style="flex:1; padding: 0 var(--ad-space-m);">
    <div style="height: 180px; border-radius: var(--ad-radius-lg); border: 1px solid var(--ad-color-border-default); background: repeating-linear-gradient(45deg, transparent 0 8px, var(--ad-color-surface-fill-2) 8px 9px), var(--ad-color-surface-fill); display:flex; flex-direction:column; align-items:center; justify-content:center; gap:6px; margin-top: var(--ad-space-s);">
      <svg width="17" height="17" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M21 8 12 3 3 8v8l9 5 9-5V8Z" /><path d="M3 8l9 5 9-5M12 13v8" /></svg>
      <span class="type-label">Photo preview</span>
    </div>
    <label class="field" style="margin-top: var(--ad-space-m);">
      Name
      <input placeholder="Dishwasher manual" />
    </label>
  </div>
  <div style="padding: var(--ad-space-m); display:flex; gap: var(--ad-space-2xs);">
    <button type="button" style="flex:1;">Retake</button>
    <button type="button" data-variant="primary" style="flex:1;">Save</button>
  </div>
</div>
<div style="width: 300px; height: 560px; background: var(--ad-color-surface-page); border-radius: var(--ad-radius-lg); box-shadow: var(--ad-shadow-float); overflow:hidden; display:flex; flex-direction:column;">
  <header style="display:flex; align-items:center; gap:8px; padding: 16px var(--ad-space-m) var(--ad-space-2xs);">
    <button type="button" class="icon-button" data-size="sm" aria-label="Back"><svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.9" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M15 18l-6-6 6-6" /></svg></button>
    <span class="type-label">Archive</span>
  </header>
  <div style="flex:1; overflow:hidden; padding: 0 var(--ad-space-m) var(--ad-space-l);">
    <h1 style="font-weight:700; font-size: var(--ad-step-2); letter-spacing:-0.01em; margin: var(--ad-space-xs) 0 var(--ad-space-2xs);">Dishwasher manual</h1>
    <div style="display:flex; gap:6px; flex-wrap:wrap; margin-bottom: var(--ad-space-m);">
      <span class="tag">location:kitchen</span>
      <span class="tag" data-dashed>+ add tag</span>
    </div>
    <div class="type-label" style="margin-bottom: var(--ad-space-2xs);">File</div>
    <ul class="card">
      <li>
        <span class="avatar" data-square><svg width="17" height="17" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M21 8 12 3 3 8v8l9 5 9-5V8Z" /><path d="M3 8l9 5 9-5M12 13v8" /></svg></span>
        <div style="flex:1; font-size: var(--ad-step--1);">PDF · 2.1MB</div>
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
