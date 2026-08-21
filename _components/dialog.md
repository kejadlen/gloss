---
title: Dialog
summary: >-
  A centered modal. Flat surface, no colored header, hairline dividers
  between title, body, and footer.
---

Dialog is the native `<dialog>` element: a `<header>` for the title, a
`<footer>` for the button row, and everything else in between is the body —
no wrapper classes at all.

The example below is shown with a plain `open` attribute, scoped to its own
preview box rather than the real viewport-covering overlay, so it renders
without JavaScript and can sit safely inside a documentation page. It
centers itself using the browser's own default `<dialog>` styling
(`position: absolute; inset: 0; margin: auto`) against the preview box,
which is why it needs that box to be `position: relative`. Call
`.showModal()` in the consuming app for the real fixed-overlay behavior —
a plain `open` attribute never paints a `::backdrop`, since that
pseudo-element only exists for a dialog shown modally.

<figure class="example">
<figcaption>Dialog</figcaption>
<div data-layout="stack">
<div class="dialog-demo">
  <dialog open>
    <header>Delete series?</header>
    <p>This removes all of its task history. This cannot be undone.</p>
    <footer>
      <button type="button">Cancel</button>
      <button type="button" data-variant="danger">Delete</button>
    </footer>
  </dialog>
</div>
</div>
<details open><summary>Markup</summary>
<pre><code>&lt;dialog open&gt;
  &lt;header&gt;Delete series?&lt;/header&gt;
  &lt;p&gt;This removes all of its task history. This cannot be undone.&lt;/p&gt;
  &lt;footer&gt;
    &lt;button type=&quot;button&quot;&gt;Cancel&lt;/button&gt;
    &lt;button type=&quot;button&quot; data-variant=&quot;danger&quot;&gt;Delete&lt;/button&gt;
  &lt;/footer&gt;
&lt;/dialog&gt;</code></pre>
</details>
</figure>

## Without a footer

A body-only dialog for a notice rather than a decision.

<figure class="example">
<figcaption>No footer</figcaption>
<div data-layout="stack">
<div class="dialog-demo" style="min-height: 14rem;">
  <dialog open style="width: 20rem;">
    <header>Backup complete</header>
    <p>412 files, 1.2GB, archived to the household drive.</p>
  </dialog>
</div>
</div>
<details><summary>Markup</summary>
<pre><code>&lt;dialog open style=&quot;width: 20rem;&quot;&gt;
  &lt;header&gt;Backup complete&lt;/header&gt;
  &lt;p&gt;412 files, 1.2GB, archived to the household drive.&lt;/p&gt;
&lt;/dialog&gt;</code></pre>
</details>
</figure>

## API

<table>
  <thead><tr><th scope="col">Element / attribute</th><th scope="col">Values</th><th scope="col">Notes</th></tr></thead>
  <tbody>
    <tr><td><code>dialog</code></td><td></td><td>Required base. Call <code>.showModal()</code> to open it for real — a plain <code>open</code> attribute is for static, always-open documentation only.</td></tr>
    <tr><td><code>dialog &gt; header</code></td><td></td><td>Optional — a body-only dialog omits it.</td></tr>
    <tr><td><code>dialog &gt; footer</code></td><td></td><td>Optional. Usually a pair of Buttons — the least committing action first.</td></tr>
    <tr><td><code>dialog::backdrop</code></td><td></td><td>The dimmed overlay. Only renders once the dialog is shown via <code>.showModal()</code>.</td></tr>
    <tr><td><code>close</code> event</td><td></td><td>Fired on cancel — wire it, or a form's <code>method="dialog"</code>, instead of an <code>onClose</code> prop.</td></tr>
  </tbody>
</table>
