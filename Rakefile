# frozen_string_literal: true

require "rake/testtask"

Rake::TestTask.new(:test) do |t|
  t.libs << "lib" << "test"
  t.test_files = FileList["test/test_*.rb"]
  t.warning = false
end

desc "Build the site into _site"
task :build do
  sh "bundle exec jekyll build"
end

desc "Serve the site with live reload on http://127.0.0.1:4000"
task :serve do
  sh "bundle exec jekyll serve --livereload"
end

desc "Run the token and colour tests, then build"
task default: %i[test build]
