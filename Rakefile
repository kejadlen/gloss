# frozen_string_literal: true

$LOAD_PATH.unshift(File.expand_path("lib", __dir__))

desc "Build the site into _site"
task :build do
  require "build"
  build
end

desc "Serve the already-built site at http://127.0.0.1:4000"
task :serve do
  require "webrick"
  require "build"

  site_dir = File.expand_path("_site", __dir__)
  abort "_site is empty — run `bundle exec rake build` first" unless Dir.exist?(site_dir)

  # Every link the build emits is prefixed with BASEURL (see relative_url in
  # lib/build.rb), so the site has to be mounted under that same path
  # locally, the way `jekyll serve` used to.
  server = WEBrick::HTTPServer.new(Port: 4000, BindAddress: "127.0.0.1", DocumentRoot: site_dir)
  server.mount(BASEURL.empty? ? "/" : BASEURL, WEBrick::HTTPServlet::FileHandler, site_dir)
  puts "http://127.0.0.1:4000#{BASEURL}/"

  trap("INT") { server.shutdown }
  server.start
end

task default: :build
