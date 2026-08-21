---
title: Toast
summary: >-
  A fixed bottom-right flash bar — the real pattern used for delete
  confirmations. Auto-dismisses after roughly 8 seconds in practice; wire
  that timer into the consuming app.
---

## Basic

The example below stays in document flow so it does not cover the page;
`.ad-toast--fixed` is what actually pins it bottom-right in a real app.

<figure class="example">
<figcaption>Toast</figcaption>
<div>
<div class="ad-toast">
  <span class="ad-toast__message">Deleted "Call Mom"</span>
  <button type="button" class="ad-toast__action">Undo</button>
  <button type="button" class="ad-toast__dismiss" aria-label="Dismiss">×</button>
</div>
</div>
<details open><summary>Markup</summary>
<pre><code>&lt;div class=&quot;ad-toast&quot;&gt;
  &lt;span class=&quot;ad-toast__message&quot;&gt;Deleted &quot;Call Mom&quot;&lt;/span&gt;
  &lt;button type=&quot;button&quot; class=&quot;ad-toast__action&quot;&gt;Undo&lt;/button&gt;
  &lt;button type=&quot;button&quot; class=&quot;ad-toast__dismiss&quot; aria-label=&quot;Dismiss&quot;&gt;×&lt;/button&gt;
&lt;/div&gt;</code></pre>
</details>
</figure>

## Without an action

<figure class="example">
<figcaption>No action</figcaption>
<div>
<div class="ad-toast">
  <span class="ad-toast__message">Series created</span>
  <button type="button" class="ad-toast__dismiss" aria-label="Dismiss">×</button>
</div>
</div>
<details><summary>Markup</summary>
<pre><code>&lt;div class=&quot;ad-toast&quot;&gt;
  &lt;span class=&quot;ad-toast__message&quot;&gt;Series created&lt;/span&gt;
  &lt;button type=&quot;button&quot; class=&quot;ad-toast__dismiss&quot; aria-label=&quot;Dismiss&quot;&gt;×&lt;/button&gt;
&lt;/div&gt;</code></pre>
</details>
</figure>

## API

<div class="ad-table-wrap">
  <table class="ad-table ad-table--compact">
    <thead><tr><th scope="col">Prop</th><th scope="col">Type</th><th scope="col">Notes</th></tr></thead>
    <tbody>
      <tr><td class="ad-token-name">message</td><td class="ad-table__code">string</td><td>Required.</td></tr>
      <tr><td class="ad-token-name">actionLabel</td><td class="ad-table__code">string</td><td>Renders a destructive-colored action, typically "Undo".</td></tr>
      <tr><td class="ad-token-name">onDismiss</td><td class="ad-table__code">function</td><td></td></tr>
    </tbody>
  </table>
</div>
