# frozen_string_literal: true

source "https://rubygems.org"

# This site is built on Ruby 4.0. The `_plugins/` directory rules out the
# GitHub-hosted Jekyll build, so .github/workflows/pages.yml builds it on
# Actions and uploads the result to Pages.
ruby "~> 4.0"

gem "jekyll", "~> 4.4"

group :jekyll_plugins do
  gem "jekyll-seo-tag", "~> 2.8"
  gem "jekyll-sitemap", "~> 1.4"
end

# Standard library that ships as a bundled gem from Ruby 3.4/4.0 onward.
# Jekyll and its dependencies still reach for these, so they have to be
# declared rather than assumed.
gem "base64", "~> 0.2"
gem "benchmark", "~> 0.4"
gem "bigdecimal", "~> 3.1"
gem "csv", "~> 3.3"
gem "logger", "~> 1.6"
gem "ostruct", "~> 0.6"

group :development, :test do
  gem "minitest", "~> 5.25"
  gem "rake", "~> 13.2"
  gem "webrick", "~> 1.9"
end
