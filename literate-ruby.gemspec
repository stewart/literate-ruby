# -*- encoding: utf-8 -*-
require File.expand_path '../lib/literate-ruby/version', __FILE__

Gem::Specification.new do |spec|
  spec.name          = "literate-ruby"
  spec.version       = LiterateRuby::VERSION
  spec.authors       = ["Andrew Stewart"]
  spec.email         = ["andrew@stwrt.ca"]
  spec.description   = %q{Literate Programming, with Ruby.}
  spec.summary       = %q{Literate Programming, with Ruby.}
  spec.homepage      = "https://github.com/stewart/literate-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "kramdown", "~> 1.2.0"
  spec.add_dependency "pygments.rb", "~> 0.5.4"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec",   "~> 2.14.1"
end
