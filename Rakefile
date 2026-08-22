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
  require "yaml"

  site_dir = File.expand_path("_site", __dir__)
  abort "_site is empty — run `bundle exec rake build` first" unless Dir.exist?(site_dir)

  # Every link the build emits is prefixed with `baseurl` (see relative_url
  # in lib/build.rb), so the site has to be mounted under that same path
  # locally, the way `jekyll serve` used to.
  baseurl = YAML.safe_load_file(File.expand_path("_config.yml", __dir__)).fetch("baseurl", "")

  server = WEBrick::HTTPServer.new(Port: 4000, BindAddress: "127.0.0.1", DocumentRoot: site_dir)
  server.mount(baseurl.empty? ? "/" : baseurl, WEBrick::HTTPServlet::FileHandler, site_dir)
  puts "http://127.0.0.1:4000#{baseurl}/"

  trap("INT") { server.shutdown }
  server.start
end

desc "Build the Claude Design upload bundle into design-bundle/"
task design: :build do
  sh "ruby script/build_design_bundle.rb"
end

task default: :build
