---
title: Toast
summary: >-
  A fixed bottom-right flash bar — the real pattern used for delete
  confirmations. Auto-dismisses after roughly 8 seconds in practice; wire
  that timer into the consuming app.
---

## Basic

`role="status"` is the correct live-region role for a transient status
message, so it doubles as the entire styling hook — no base class. The
example below stays in document flow so it does not cover the page;
`[data-fixed]` is what actually pins it bottom-right in a real app. The
action and dismiss buttons are plain `<button>`s told apart by
`aria-label="Dismiss"`, an attribute the icon-only close control needs
anyway.

<figure class="example">
<figcaption>Toast</figcaption>
<div>
<div role="status">
  <span>Deleted "Call Mom"</span>
  <button>Undo</button>
  <button aria-label="Dismiss">×</button>
</div>
</div>
<details open><summary>Markup</summary>
<pre><code>&lt;div role=&quot;status&quot;&gt;
  &lt;span&gt;Deleted &quot;Call Mom&quot;&lt;/span&gt;
  &lt;button&gt;Undo&lt;/button&gt;
  &lt;button aria-label=&quot;Dismiss&quot;&gt;×&lt;/button&gt;
&lt;/div&gt;</code></pre>
</details>
</figure>

## Without an action

<figure class="example">
<figcaption>No action</figcaption>
<div>
<div role="status">
  <span>Series created</span>
  <button aria-label="Dismiss">×</button>
</div>
</div>
<details><summary>Markup</summary>
<pre><code>&lt;div role=&quot;status&quot;&gt;
  &lt;span&gt;Series created&lt;/span&gt;
  &lt;button aria-label=&quot;Dismiss&quot;&gt;×&lt;/button&gt;
&lt;/div&gt;</code></pre>
</details>
</figure>

## API

<table>
  <thead><tr><th scope="col">Element / attribute</th><th scope="col">Values</th><th scope="col">Notes</th></tr></thead>
  <tbody>
    <tr><td><code>[role="status"]</code></td><td></td><td>Required base, on a <code>&lt;div&gt;</code>.</td></tr>
    <tr><td><code>&gt; span</code></td><td>string</td><td>The message. Required.</td></tr>
    <tr><td><code>&gt; button</code></td><td></td><td>Renders a destructive-colored action, typically "Undo".</td></tr>
    <tr><td><code>&gt; button[aria-label="Dismiss"]</code></td><td></td><td>The × control — the label is what tells it apart from the action button.</td></tr>
    <tr><td><code>data-fixed</code></td><td>boolean</td><td>Pins the toast bottom-right of the viewport. Omit to stay in document flow.</td></tr>
  </tbody>
</table>
