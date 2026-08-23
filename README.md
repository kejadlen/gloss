# Arbitrary Definitions

A personal design system for self-hosted, single-user tools — synthesized by
reading three real, running personal projects, not written from a spec.
Sixteen components and five foundations, documented by a small Ruby/ERB site
(no Jekyll) with hand-maintained CSS and hand-written content.

**Site:** https://kejadlen.github.io/arbitrary-definitions-design-system/

## The idea

Arbitrary Definitions is an umbrella for side projects: self-hosted tools
built for one household or one person, never a SaaS product. Almost every
value in it is arbitrary — the accent is teal because someone liked it, the
type scale ratio is 1.20 at the small end because that looked right, not
because it is correct. What makes it a *system* is not that the choices are
correct but that they are written down once, given names, actually used, and
therefore changeable.

It was synthesized, not specified — built by reading three real projects
([domus](https://github.com/kejadlen/domus),
[ketchup](https://github.com/kejadlen/ketchup),
[quire](https://github.com/kejadlen/quire)) and finding what they actually
share. See [Why arbitrary](https://kejadlen.github.io/arbitrary-definitions-design-system/rationale/)
for the full story.

This is a small, personal project, so it is built as plainly as it can be:

- `assets/css/tokens.css` is a hand-maintained stylesheet of custom
  properties — a `:root` block, both dark-theme selectors, and a
  `prefers-reduced-motion` override that zeroes every duration token. Edit
  the values directly; there is no compiler in front of it.
- `_sass/` holds the component and site-chrome CSS as plain, already-flat
  files (one per component group). `rake build` concatenates them in a fixed
  order into `assets/css/style.css` — no Sass compiler involved.
- The documentation tables, swatches, and contrast figures are static
  markup, transcribed once from the token values rather than recomputed on
  every build.
- Component demos are plain HTML: a `<figure>` with the live preview and,
  underneath it in a `<details>`, the exact same markup as literal text.
  There is no generator keeping the two in sync — there is only one copy.

No component stylesheet contains a color literal or a duration — every one is a `var(--ad-*)`, with one flagged exception (Select's chevron — see `_sass/components/field.css`).

## Requirements

Ruby 4.0 (`.ruby-version` pins 4.0.6) and Bundler.

```console
$ bundle install
$ bundle exec rake          # build
$ bundle exec rake serve    # http://127.0.0.1:4000
```

## Layout

| Path | What it is |
| --- | --- |
| `assets/css/tokens.css` | Every color, type, space, radius, elevation, and motion value in the system, hand-maintained. |
| `_sass/` | Plain CSS: base/reset, components (core/forms/feedback/navigation), and this documentation site's own chrome. Concatenated into `style.css` at build time. |
| `lib/build.rb` | The whole site builder in one file: a literal list of pages, front matter, ERB, and Kramdown. No collections config, no layout inheritance, no generic includes system — this is one specific site, not a framework. |
| `_layouts/page.erb` | The one page shell (head, header, sidebar, footer). |
| `_foundations/`, `_components/`, `_patterns/` | The documentation pages — static Markdown and HTML with a little ERB for links and nav. |
| `.github/workflows/pages.yml` | Build on Ruby 4.0, deploy to Pages. |

## Deployment

There is no Jekyll to run here — `Rakefile`'s `build` task drives
`lib/build.rb` directly — but the build still
runs on GitHub Actions rather than relying on GitHub's hosted build, mainly
so it runs on the pinned Ruby 4.0 rather than whatever Ruby the Pages runner
ships. `.github/workflows/pages.yml` builds it with `ruby/setup-ruby` and
uploads the result with `actions/deploy-pages`.

Every branch is built; only the repository's default branch deploys.

**One-time setup:** set **Settings → Pages → Build and deployment → Source**
to **GitHub Actions**. The workflow token is not permitted to turn Pages on
by itself, so the `deploy` job fails until this is done — the `build` job
runs regardless.

The site's `BASEURL` is a constant in `lib/build.rb` rather than coming from
`actions/configure-pages`, which keeps the build independent of the Pages
API. Change it there if the site ever moves off a project page.

## Using the CSS elsewhere

Two files, in this order, and almost no JavaScript:

```html
<link rel="stylesheet" href="tokens.css">
<link rel="stylesheet" href="style.css">
```

Retheming means overriding a handful of custom properties after `tokens.css`
loads — no recompile, no fork. See [Using the CSS](https://kejadlen.github.io/arbitrary-definitions-design-system/install/).

## Claude Code skill

This repo doubles as a Claude Code skill — `SKILL.md` at the root, in the
standard [Agent Skills](https://code.claude.com/docs/en/skills) format.
Clone this repo into `.claude/skills/arbitrary-definitions/` in another
project and Claude picks it up automatically, with the exact component
contracts, tokens, and voice guidance to build new interfaces that look like
they came from the same hand as this one:

```console
$ git clone https://github.com/kejadlen/arbitrary-definitions-design-system \
    .claude/skills/arbitrary-definitions
```
