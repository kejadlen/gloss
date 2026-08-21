---
title: Card
summary: >-
  A bordered sheet with an optional media area, a body, and a footer. Elevation
  is opt-in.
---

## Anatomy

{% example title="Card" layout="stack" open %}
<article class="ad-card" style="max-width: 22rem;">
  <div class="ad-card__body">
    <h3 class="ad-card__title">Persimmon 700</h3>
    <p class="ad-card__text">
      The light theme's accent. Clears AA against both the canvas and white,
      which the 600 step did not.
    </p>
  </div>
  <div class="ad-card__footer">
    <span class="ad-badge ad-badge--accent">Accent</span>
    <span class="ad-subtle" style="font-size: var(--ad-text-xs);">#c2260c</span>
  </div>
</article>
{% endexample %}

## Grids

`.ad-card-grid` is `repeat(auto-fill, minmax(15rem, 1fr))`. Cards in it stretch
to equal height, and `margin-top: auto` on the footer pins footers to the bottom
regardless of how much body copy each card has.

{% example title="A grid of uneven cards" layout="stack" surface="sunken" %}
<div class="ad-card-grid">
  <article class="ad-card">
    <div class="ad-card__body">
      <h3 class="ad-card__title">Short</h3>
      <p class="ad-card__text">One line.</p>
    </div>
    <div class="ad-card__footer"><button type="button" class="ad-btn ad-btn--ghost ad-btn--sm">Open</button></div>
  </article>
  <article class="ad-card">
    <div class="ad-card__body">
      <h3 class="ad-card__title">Longer</h3>
      <p class="ad-card__text">
        Enough copy here to push this card taller than its neighbour, which is
        exactly the case that breaks a grid built on floats.
      </p>
    </div>
    <div class="ad-card__footer"><button type="button" class="ad-btn ad-btn--ghost ad-btn--sm">Open</button></div>
  </article>
  <article class="ad-card">
    <div class="ad-card__body">
      <h3 class="ad-card__title">Middling</h3>
      <p class="ad-card__text">Two lines of copy, which lands between the other two.</p>
    </div>
    <div class="ad-card__footer"><button type="button" class="ad-btn ad-btn--ghost ad-btn--sm">Open</button></div>
  </article>
</div>
{% endexample %}

## Clickable cards

Do not wrap a whole card in an `<a>`. It makes the entire block one enormous
link target, which is miserable to read with a screen reader and impossible to
select text inside. Put the link on the heading and let `.ad-card--link` handle
the hover and focus affordance for the card around it.

{% example title="Linked card" layout="stack" %}
<article class="ad-card ad-card--link" style="max-width: 22rem;">
  <div class="ad-card__body">
    <h3 class="ad-card__title">
      <a href="{{ '/foundations/elevation/' | relative_url }}">Elevation</a>
    </h3>
    <p class="ad-card__text">
      The heading is the link. The card lights up on hover and shows a focus ring
      when the link inside it is focused, via <code>:focus-within</code>.
    </p>
  </div>
</article>
{% endexample %}

## Avatars

{% example title="Avatars" %}
<span class="ad-avatar ad-avatar--sm">ad</span>
<span class="ad-avatar">ad</span>
<span class="ad-avatar ad-avatar--lg">ad</span>
<span class="ad-avatar-stack">
  <span class="ad-avatar ad-avatar--sm">ka</span>
  <span class="ad-avatar ad-avatar--sm">mr</span>
  <span class="ad-avatar ad-avatar--sm">tp</span>
</span>
{% endexample %}

Stacked avatars overlap by half a step and carry a 2px ring in the surface
colour, so the stack still reads on any background the card can sit on.

## Rules

- **A card is a container, not a component.** It has no opinion about what goes
  inside it beyond spacing.
- **Border or shadow, not both** — see [Elevation]({{ '/foundations/elevation/' | relative_url }}).
- **The heading is the link.** Never the whole card.
