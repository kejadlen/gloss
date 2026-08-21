# frozen_string_literal: true

module ArbitraryDefinitions
  # A thin, read-only wrapper that lets plain Ruby Hashes (as loaded from the
  # YAML under `_data/`) be addressed with dotted method calls the way Liquid
  # addressed them — `group.name`, `token.usage`, `step.value` — so the
  # templates ported from `{{ }}` interpolation read the same way they always
  # did, without inventing a second token-access API.
  #
  # Hashes are wrapped; Arrays are mapped eagerly to arrays of wrapped
  # elements (so `Array` methods like `size`, `find`, `each`, `sort_by` all
  # keep working, since Ruby's ERB templates write plain Ruby rather than a
  # ported Liquid filter chain); anything else passes through untouched.
  class Dot
    def self.wrap(value)
      case value
      when Dot then value
      when Hash then new(value)
      when Array then value.map { |element| wrap(element) }
      else value
      end
    end

    def initialize(hash)
      @hash = hash
    end

    def [](key)
      Dot.wrap(@hash[key.to_s])
    end

    def key?(key)
      @hash.key?(key.to_s)
    end

    def to_h
      @hash
    end

    # Hash-style iteration, yielding the key and the wrapped value — used for
    # `_data/tokens/contrast.yml`, which is a hash of sections rather than a
    # list.
    def each
      return enum_for(:each) unless block_given?

      @hash.each { |key, value| yield key, Dot.wrap(value) }
    end

    # An absent key returns nil rather than raising — Liquid's `{{ page.foo }}`
    # silently rendered blank for an undefined property, and several pages
    # rely on that for genuinely optional front matter (`page.summary`,
    # `page.section`, `page.description`), so this keeps the same forgiving
    # behavior rather than making every optional field a special case at
    # every call site.
    def method_missing(name, *args)
      return super unless args.empty? && !name.to_s.end_with?("=")

      Dot.wrap(@hash[name.to_s])
    end

    def respond_to_missing?(_name, include_private = false)
      true
    end

    def inspect
      "#<ArbitraryDefinitions::Dot #{@hash.inspect}>"
    end
  end
end
