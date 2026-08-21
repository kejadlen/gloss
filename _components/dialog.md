---
title: Dialog
summary: >-
  A centered modal. Flat surface, no colored header, hairline dividers
  between title, body, and footer.
---

The example below is shown open, scoped to its own preview box rather than
the real viewport-covering overlay, so it can sit safely inside a
documentation page. Wire real open/close state — and a `position: fixed`
overlay — in the consuming app; this is a pixel recreation for documentation,
not a functioning modal.

<figure class="example">
<figcaption>Dialog</figcaption>
<div data-layout="stack">
<div class="ad-dialog-demo">
  <div class="ad-dialog__overlay">
    <div class="ad-dialog">
      <div class="ad-dialog__title">Delete series?</div>
      <div class="ad-dialog__body">This removes all of its task history. This cannot be undone.</div>
      <div class="ad-dialog__footer">
        <button type="button" class="ad-btn">Cancel</button>
        <button type="button" class="ad-btn ad-btn--danger">Delete</button>
      </div>
    </div>
  </div>
</div>
</div>
<details open><summary>Markup</summary>
<pre><code>&lt;div class=&quot;ad-dialog-demo&quot;&gt;
  &lt;div class=&quot;ad-dialog__overlay&quot;&gt;
    &lt;div class=&quot;ad-dialog&quot;&gt;
      &lt;div class=&quot;ad-dialog__title&quot;&gt;Delete series?&lt;/div&gt;
      &lt;div class=&quot;ad-dialog__body&quot;&gt;This removes all of its task history. This cannot be undone.&lt;/div&gt;
      &lt;div class=&quot;ad-dialog__footer&quot;&gt;
        &lt;button type=&quot;button&quot; class=&quot;ad-btn&quot;&gt;Cancel&lt;/button&gt;
        &lt;button type=&quot;button&quot; class=&quot;ad-btn ad-btn--danger&quot;&gt;Delete&lt;/button&gt;
      &lt;/div&gt;
    &lt;/div&gt;
  &lt;/div&gt;
&lt;/div&gt;</code></pre>
</details>
</figure>

## Without a footer

A body-only dialog for a notice rather than a decision.

<figure class="example">
<figcaption>No footer</figcaption>
<div data-layout="stack">
<div class="ad-dialog-demo" style="min-height: 14rem;">
  <div class="ad-dialog__overlay">
    <div class="ad-dialog" style="width: 20rem;">
      <div class="ad-dialog__title">Backup complete</div>
      <div class="ad-dialog__body">412 files, 1.2GB, archived to the household drive.</div>
    </div>
  </div>
</div>
</div>
<details><summary>Markup</summary>
<pre><code>&lt;div class=&quot;ad-dialog-demo&quot; style=&quot;min-height: 14rem;&quot;&gt;
  &lt;div class=&quot;ad-dialog__overlay&quot;&gt;
    &lt;div class=&quot;ad-dialog&quot; style=&quot;width: 20rem;&quot;&gt;
      &lt;div class=&quot;ad-dialog__title&quot;&gt;Backup complete&lt;/div&gt;
      &lt;div class=&quot;ad-dialog__body&quot;&gt;412 files, 1.2GB, archived to the household drive.&lt;/div&gt;
    &lt;/div&gt;
  &lt;/div&gt;
&lt;/div&gt;</code></pre>
</details>
</figure>

## API

<div class="ad-table-wrap">
  <table class="ad-table ad-table--compact">
    <thead><tr><th scope="col">Prop</th><th scope="col">Type</th><th scope="col">Notes</th></tr></thead>
    <tbody>
      <tr><td class="ad-token-name">open</td><td class="ad-table__code">boolean</td><td>Required.</td></tr>
      <tr><td class="ad-token-name">title</td><td class="ad-table__code">string</td><td>Optional — a body-only dialog omits the title bar.</td></tr>
      <tr><td class="ad-token-name">onClose</td><td class="ad-table__code">function</td><td>Fired on overlay click.</td></tr>
      <tr><td class="ad-token-name">footer</td><td class="ad-table__code">node</td><td>Usually a pair of Buttons — the least committing action first.</td></tr>
    </tbody>
  </table>
</div>
