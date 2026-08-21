---
title: Switch
summary: >-
  Toggle switch for on/off settings. The one moving part in this system —
  everything else transitions color or border, never position.
---

## Basic

`role="switch"` is the correct ARIA role for a toggle, so it doubles as the
attribute that tells Switch's `input[type="checkbox"]` apart from a plain
Checkbox — real accessibility markup doing double duty as a style hook. The
track and thumb still need `.switch`, one sanctioned fallback class: the
thumb's independent position and transition need a second element, more than
`appearance: none` plus pseudo-elements on the input itself can cleanly
carry.

<figure class="example">
<figcaption>Switch</figcaption>
<div>
<label class="switch">
  <input type="checkbox" role="switch" checked="" />
  <span></span>
  Dark mode
</label>
<label class="switch">
  <input type="checkbox" role="switch" />
  <span></span>
  Weekly digest
</label>
</div>
<details open><summary>Markup</summary>
<pre><code>&lt;label class=&quot;switch&quot;&gt;
  &lt;input type=&quot;checkbox&quot; role=&quot;switch&quot; checked=&quot;&quot; /&gt;
  &lt;span&gt;&lt;/span&gt;
  Dark mode
&lt;/label&gt;
&lt;label class=&quot;switch&quot;&gt;
  &lt;input type=&quot;checkbox&quot; role=&quot;switch&quot; /&gt;
  &lt;span&gt;&lt;/span&gt;
  Weekly digest
&lt;/label&gt;</code></pre>
</details>
</figure>

## Disabled

<figure class="example">
<figcaption>Disabled</figcaption>
<div>
<label class="switch">
  <input type="checkbox" role="switch" checked="" disabled="" />
  <span></span>
  Always on for this plan
</label>
</div>
<details><summary>Markup</summary>
<pre><code>&lt;label class=&quot;switch&quot;&gt;
  &lt;input type=&quot;checkbox&quot; role=&quot;switch&quot; checked=&quot;&quot; disabled=&quot;&quot; /&gt;
  &lt;span&gt;&lt;/span&gt;
  Always on for this plan
&lt;/label&gt;</code></pre>
</details>
</figure>

## API

<table>
  <thead><tr><th scope="col">Element / attribute</th><th scope="col">Values</th><th scope="col">Notes</th></tr></thead>
  <tbody>
    <tr><td><code>label.switch</code></td><td></td><td>Required wrapper.</td></tr>
    <tr><td><code>input[type="checkbox"][role="switch"]</code></td><td></td><td>Required — the role is what makes it a Switch instead of a Checkbox.</td></tr>
    <tr><td><code>&gt; span</code></td><td></td><td>Required — the track and thumb. No class, just structural position.</td></tr>
    <tr><td><code>checked</code></td><td>boolean</td><td></td></tr>
    <tr><td><code>disabled</code></td><td>boolean</td><td></td></tr>
  </tbody>
</table>
