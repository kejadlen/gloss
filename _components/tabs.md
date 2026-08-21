---
title: Tabs
summary: >-
  Two real variants: underline for primary section navigation, segmented for
  filters. The WAI-ARIA tabs pattern, wired up in vanilla JavaScript — arrows
  move, Home/End jump to the ends.
---

Tabs follows the real WAI-ARIA tabs pattern: `[role="tablist"]` contains
`[role="tab"]` buttons controlling `[role="tabpanel"]`s. Those roles are
required for the pattern to be accessible in the first place, so they are the
entire styling contract too — no classes anywhere in this component. The
keyboard wiring (`assets/js/system.js`) only looks for `[data-tabs]` /
`[role=tab]`, so the root wrapper keeps that one data attribute and needs
nothing else.

## Underline

Mono, with an accent underline. For primary section navigation — a project's
own tabs, never a filter. This is the default; no `data-variant` needed.

<figure class="example">
<figcaption>Underline</figcaption>
<div data-layout="stack">
<div data-tabs="">
  <div role="tablist" aria-label="Repository">
    <button role="tab" id="tabs-code-tab" aria-controls="tabs-code-panel" aria-selected="true" tabindex="0">Code</button>
    <button role="tab" id="tabs-ci-tab" aria-controls="tabs-ci-panel" aria-selected="false" tabindex="-1">CI</button>
    <button role="tab" id="tabs-issues-tab" aria-controls="tabs-issues-panel" aria-selected="false" tabindex="-1">Issues</button>
  </div>
  <div role="tabpanel" id="tabs-code-panel" aria-labelledby="tabs-code-tab" tabindex="0">Repository contents.</div>
  <div role="tabpanel" id="tabs-ci-panel" aria-labelledby="tabs-ci-tab" tabindex="0" hidden="">Build history.</div>
  <div role="tabpanel" id="tabs-issues-panel" aria-labelledby="tabs-issues-tab" tabindex="0" hidden="">Open issues.</div>
</div>
</div>
<details open><summary>Markup</summary>
<pre><code>&lt;div data-tabs=&quot;&quot;&gt;
  &lt;div role=&quot;tablist&quot; aria-label=&quot;Repository&quot;&gt;
    &lt;button role=&quot;tab&quot; id=&quot;tabs-code-tab&quot; aria-controls=&quot;tabs-code-panel&quot; aria-selected=&quot;true&quot; tabindex=&quot;0&quot;&gt;Code&lt;/button&gt;
    &lt;button role=&quot;tab&quot; id=&quot;tabs-ci-tab&quot; aria-controls=&quot;tabs-ci-panel&quot; aria-selected=&quot;false&quot; tabindex=&quot;-1&quot;&gt;CI&lt;/button&gt;
    &lt;button role=&quot;tab&quot; id=&quot;tabs-issues-tab&quot; aria-controls=&quot;tabs-issues-panel&quot; aria-selected=&quot;false&quot; tabindex=&quot;-1&quot;&gt;Issues&lt;/button&gt;
  &lt;/div&gt;
  &lt;div role=&quot;tabpanel&quot; id=&quot;tabs-code-panel&quot; aria-labelledby=&quot;tabs-code-tab&quot; tabindex=&quot;0&quot;&gt;Repository contents.&lt;/div&gt;
  &lt;div role=&quot;tabpanel&quot; id=&quot;tabs-ci-panel&quot; aria-labelledby=&quot;tabs-ci-tab&quot; tabindex=&quot;0&quot; hidden=&quot;&quot;&gt;Build history.&lt;/div&gt;
  &lt;div role=&quot;tabpanel&quot; id=&quot;tabs-issues-panel&quot; aria-labelledby=&quot;tabs-issues-tab&quot; tabindex=&quot;0&quot; hidden=&quot;&quot;&gt;Open issues.&lt;/div&gt;
&lt;/div&gt;</code></pre>
</details>
</figure>

## Segmented

A pill track; the active segment lifts to the surface. For filters — *All ·
Overdue · Upcoming* — never primary navigation. `data-variant="segmented"` on
the tablist is the only attribute either variant needs, since neither has a
natural one of its own.

<figure class="example">
<figcaption>Segmented</figcaption>
<div data-layout="stack">
<div data-tabs="">
  <div role="tablist" data-variant="segmented" aria-label="Filter">
    <button role="tab" id="tabs-all-tab" aria-controls="tabs-all-panel" aria-selected="true" tabindex="0">All</button>
    <button role="tab" id="tabs-overdue-tab" aria-controls="tabs-overdue-panel" aria-selected="false" tabindex="-1">Overdue</button>
    <button role="tab" id="tabs-upcoming-tab" aria-controls="tabs-upcoming-panel" aria-selected="false" tabindex="-1">Upcoming</button>
  </div>
  <div role="tabpanel" id="tabs-all-panel" aria-labelledby="tabs-all-tab" tabindex="0">7 series.</div>
  <div role="tabpanel" id="tabs-overdue-panel" aria-labelledby="tabs-overdue-tab" tabindex="0" hidden="">2 series.</div>
  <div role="tabpanel" id="tabs-upcoming-panel" aria-labelledby="tabs-upcoming-tab" tabindex="0" hidden="">5 series.</div>
</div>
</div>
<details><summary>Markup</summary>
<pre><code>&lt;div data-tabs=&quot;&quot;&gt;
  &lt;div role=&quot;tablist&quot; data-variant=&quot;segmented&quot; aria-label=&quot;Filter&quot;&gt;
    &lt;button role=&quot;tab&quot; id=&quot;tabs-all-tab&quot; aria-controls=&quot;tabs-all-panel&quot; aria-selected=&quot;true&quot; tabindex=&quot;0&quot;&gt;All&lt;/button&gt;
    &lt;button role=&quot;tab&quot; id=&quot;tabs-overdue-tab&quot; aria-controls=&quot;tabs-overdue-panel&quot; aria-selected=&quot;false&quot; tabindex=&quot;-1&quot;&gt;Overdue&lt;/button&gt;
    &lt;button role=&quot;tab&quot; id=&quot;tabs-upcoming-tab&quot; aria-controls=&quot;tabs-upcoming-panel&quot; aria-selected=&quot;false&quot; tabindex=&quot;-1&quot;&gt;Upcoming&lt;/button&gt;
  &lt;/div&gt;
  &lt;div role=&quot;tabpanel&quot; id=&quot;tabs-all-panel&quot; aria-labelledby=&quot;tabs-all-tab&quot; tabindex=&quot;0&quot;&gt;7 series.&lt;/div&gt;
  &lt;div role=&quot;tabpanel&quot; id=&quot;tabs-overdue-panel&quot; aria-labelledby=&quot;tabs-overdue-tab&quot; tabindex=&quot;0&quot; hidden=&quot;&quot;&gt;2 series.&lt;/div&gt;
  &lt;div role=&quot;tabpanel&quot; id=&quot;tabs-upcoming-panel&quot; aria-labelledby=&quot;tabs-upcoming-tab&quot; tabindex=&quot;0&quot; hidden=&quot;&quot;&gt;5 series.&lt;/div&gt;
&lt;/div&gt;</code></pre>
</details>
</figure>

## Rules

- **Never both variants in one view.** Underline is for the page's own
  sections; segmented is for filtering what is already on screen.
- **Segmented is not primary navigation.** If it decides which screen the
  reader is on, it should be underline.

## API

<table>
  <thead><tr><th scope="col">Element / attribute</th><th scope="col">Values</th><th scope="col">Notes</th></tr></thead>
  <tbody>
    <tr><td><code>[data-tabs]</code></td><td></td><td>Required on the root wrapper — what the keyboard wiring in <code>system.js</code> looks for.</td></tr>
    <tr><td><code>[role="tablist"]</code></td><td></td><td>Required. Contains the tab buttons.</td></tr>
    <tr><td><code>[role="tab"]</code></td><td></td><td>Required, one per item. <code>aria-selected</code> and <code>tabindex</code> are managed by the JS.</td></tr>
    <tr><td><code>[role="tabpanel"]</code></td><td></td><td>Required, one per item, referenced by the tab's <code>aria-controls</code>.</td></tr>
    <tr><td><code>data-variant</code></td><td><code>segmented</code></td><td>On the tablist. Omit for the default underline look.</td></tr>
  </tbody>
</table>
