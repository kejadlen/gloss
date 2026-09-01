---
title: Refusals
permalink: /refusals/
section: Start here
summary: >-
  A consolidated checklist of generated-interface tells this system refuses
  to produce — for auditing a new screen before it ships.
---

Generated interfaces converge on a small set of shapes: the eyebrow over a
headline, the icon tile above a card title, the softly-glowing dark theme.
None of them are accidental omissions here — each is already refused by a
rule on the relevant foundation page. This page exists only to put all of
them in one place, so a new screen can be checked against the whole list at
once instead of five pages in sequence. These are laws, not preferences: a
screen that breaks one is off-system.

<div class="card-grid">
<article class="card">
<div class="card-body">
<h3>Surface &amp; elevation</h3>
<ul>
<li>No cream or beige page. The stock is warm but held close to neutral.</li>
<li>No side-accent bar on a card, no four-sided border, no border around a bounded surface at all — surface contrast does the identifying work.</li>
<li>No decorative grid, stripe field, or radial glow. Flat color only.</li>
<li>No radius above <code>--gl-radius-lg</code> on a card, no custom corner value outside the token scale.</li>
<li>No dark theme with colored glows.</li>
</ul>
</div>
</article>
<article class="card">
<div class="card-body">
<h3>Type &amp; hierarchy</h3>
<ul>
<li>No kicker or eyebrow above a heading. A heading is already the top of its own hierarchy.</li>
<li>Uppercase and tracking stay on <code>type-label</code>. Never on body copy, never on a heading.</li>
<li>No gradient text. No italic serif display headline.</li>
<li>Adjacent steps in the type scale are 1.2&ndash;1.25 apart &mdash; not enough contrast on their own. Skip a step between a heading and the body under it.</li>
<li>A heading gets more space above it than below it.</li>
</ul>
</div>
</article>
<article class="card">
<div class="card-body">
<h3>Layout &amp; structure</h3>
<ul>
<li>No card inside a card. One level, then spacing and rules do the rest.</li>
<li>A grid of cards is fine when each card is a real, distinct object. What's refused is the decorative version &mdash; identical icon-and-heading cards standing in for a list. Repeated, uniform items belong on a <a href="<%= relative_url('/components/card-row/') %>">CardRow</a> list.</li>
<li>No icon tile stacked above a heading. An icon sits beside its label, in flow.</li>
<li>No decorative numbered section labels. A number appears only when it's real data.</li>
</ul>
</div>
</article>
<article class="card">
<div class="card-body">
<h3>Motion</h3>
<ul>
<li>No pulsing status dot. Status is a <a href="<%= relative_url('/components/badge/') %>">Badge</a> &mdash; tone plus mono uppercase text, on no background. It never animates on its own.</li>
<li>No blinking cursor in non-editable copy, no marquee, no bounce or elastic easing.</li>
<li>No hover scale on imagery. Animate <code>transform</code> and <code>opacity</code>, never <code>width</code> or <code>height</code>.</li>
</ul>
</div>
</article>
<article class="card">
<div class="card-body">
<h3>Copy</h3>
<ul>
<li>At most two em-dashes in a passage. Commas, colons, and periods carry the same joins without the cadence.</li>
<li>No &ldquo;not X, a Y&rdquo; aphorisms, and no manufactured contrast as a closing line. State the thing once.</li>
<li>Nothing gets dismissed as &ldquo;theater.&rdquo; Say plainly what a thing does or does not do.</li>
</ul>
</div>
</article>
</div>

Each rule above is already enforced on its own foundation or component
page — [Color](<%= relative_url('/foundations/color/') %>),
[Elevation](<%= relative_url('/foundations/elevation/') %>),
[Typography](<%= relative_url('/foundations/typography/') %>), and
[Motion](<%= relative_url('/foundations/motion/') %>) — and in the Voice
section of `SKILL.md`. This page only collects them into one list.
