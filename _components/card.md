---
title: Card
summary: >-
  Flat surface, hairline border, radius-lg. Elevation is opt-in, reserved for
  the one focused card in a view — a dialog, the primary capture card.
---

A `<div>`/`<article>` is too generic to style bare, so Card keeps one
sanctioned class. `[data-elevated]` is for the single most-elevated element on
screen — never a whole grid of cards at once.

## Flat vs. elevated

<figure class="example">
<figcaption>Flat and elevated</figcaption>
<div data-surface="sunken">
<div class="card" style="width: 14rem; padding: var(--gl-space-s);">Flat — the default.</div>
<div class="card" data-elevated style="width: 14rem; padding: var(--gl-space-s);">Elevated — one per view.</div>
</div>
<details><summary>Markup</summary>
<pre><code>&lt;div class=&quot;card&quot; style=&quot;width: 14rem; padding: var(--gl-space-s);&quot;&gt;Flat — the default.&lt;/div&gt;
&lt;div class=&quot;card&quot; data-elevated style=&quot;width: 14rem; padding: var(--gl-space-s);&quot;&gt;Elevated — one per view.&lt;/div&gt;</code></pre>
</details>
</figure>

## As a content tile

Used standalone (not as a row-list), `.card` is fine on its own — `.card-body`
and `.card-footer` are two more sanctioned classes, for the one shape inside
it that has no element of its own to hang a selector on.

<figure class="example">
<figcaption>Content tile</figcaption>
<div>
<article class="card" style="max-width: 18rem;">
  <div class="card-body">
    <p class="type-label" style="margin:0;">Recommended</p>
    <h3>Rename the caution color</h3>
    <p>Three people have called it "yellow" in review this month.</p>
  </div>
  <div class="card-footer">
    <button data-variant="primary" data-size="sm">Approve</button>
    <button data-variant="ghost" data-size="sm">Dismiss</button>
  </div>
</article>
</div>
<details><summary>Markup</summary>
<pre><code>&lt;article class=&quot;card&quot; style=&quot;max-width: 18rem;&quot;&gt;
  &lt;div class=&quot;card-body&quot;&gt;
    &lt;p class=&quot;type-label&quot; style=&quot;margin:0;&quot;&gt;Recommended&lt;/p&gt;
    &lt;h3&gt;Rename the caution color&lt;/h3&gt;
    &lt;p&gt;Three people have called it &quot;yellow&quot; in review this month.&lt;/p&gt;
  &lt;/div&gt;
  &lt;div class=&quot;card-footer&quot;&gt;
    &lt;button data-variant=&quot;primary&quot; data-size=&quot;sm&quot;&gt;Approve&lt;/button&gt;
    &lt;button data-variant=&quot;ghost&quot; data-size=&quot;sm&quot;&gt;Dismiss&lt;/button&gt;
  &lt;/div&gt;
&lt;/article&gt;</code></pre>
</details>
</figure>

## As a list — with CardRow

Card's most common job in this system is holding a list of
[CardRow](<%= relative_url('/components/card-row/') %>)s: entry lists, task
lists, settings rows. In that shape Card is a real `<ul class="card">` and
CardRow is a bare `<li>` — the divider between rows comes from the `.card >
li` descendant selector, no second class needed.

<figure class="example">
<figcaption>Card of rows</figcaption>
<div>
<ul class="card" style="max-width: 22rem;">
  <li>Dishwasher manual</li>
  <li>Sofa receipt</li>
  <li>Passport scan</li>
</ul>
</div>
<details><summary>Markup</summary>
<pre><code>&lt;ul class=&quot;card&quot; style=&quot;max-width: 22rem;&quot;&gt;
  &lt;li&gt;Dishwasher manual&lt;/li&gt;
  &lt;li&gt;Sofa receipt&lt;/li&gt;
  &lt;li&gt;Passport scan&lt;/li&gt;
&lt;/ul&gt;</code></pre>
</details>
</figure>

## API

<table>
  <thead><tr><th scope="col">Element / attribute</th><th scope="col">Values</th><th scope="col">Notes</th></tr></thead>
  <tbody>
    <tr><td><code>.card</code></td><td></td><td>Required base, on a <code>&lt;div&gt;</code>/<code>&lt;article&gt;</code> for a standalone tile or a <code>&lt;ul&gt;</code> for a list of rows.</td></tr>
    <tr><td><code>data-elevated</code></td><td>boolean</td><td>Applies <code>--gl-shadow-float</code>. One per view.</td></tr>
    <tr><td><code>&gt; li</code></td><td></td><td>A CardRow, when Card is a <code>&lt;ul&gt;</code>. See <a href="<%= relative_url('/components/card-row/') %>">CardRow</a>.</td></tr>
  </tbody>
</table>
