# frozen_string_literal: true

$LOAD_PATH.unshift(File.expand_path("../lib", __dir__))

require "arbitrary_definitions/token_set"

module ArbitraryDefinitions
  # Compiles _data/tokens/*.yml into assets/css/tokens.css during the build,
  # and hands the resolved token set back to Liquid as `site.data.tokens.*`
  # so the documentation tables and the stylesheet cannot disagree.
  class TokenGenerator < Jekyll::Generator
    safe true
    priority :highest

    def generate(site)
      token_set = TokenSet.new(
        dir: File.join(site.source, "_data", "tokens"),
        prefix: site.config.fetch("token_prefix", "ad"),
      )

      site.pages << stylesheet(site, token_set)

      site.data["token_prefix"]   = token_set.prefix
      site.data["semantic_flat"]  = token_set.semantic_tokens
      site.data["tokens_css_size"] = token_set.to_css.bytesize
      site.data["build"] = {
        "ruby" => RUBY_VERSION,
        "jekyll" => Jekyll::VERSION,
        "ramps" => token_set.ramps.size,
        "aliases" => token_set.semantic_tokens.size,
        "generated_at" => Time.now.utc.strftime("%Y-%m-%d"),
      }

      Jekyll.logger.info "Tokens:", "compiled #{token_set.semantic_tokens.size} aliases " \
                                    "from #{token_set.ramps.size} ramps"
    end

    private

    def stylesheet(site, token_set)
      page = Jekyll::PageWithoutAFile.new(site, site.source, "assets/css", "tokens.css")
      page.content = token_set.to_css
      page.data["layout"] = nil
      page
    end
  end
end
