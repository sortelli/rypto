# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rypto/version'

Gem::Specification.new do |spec|
  spec.name          = "rypto"
  spec.version       = Rypto::VERSION
  spec.authors       = ["Joe Sortelli"]
  spec.email         = ["joe@sortelli.com"]
  spec.summary       = "Krypto card game solver."
  spec.description   = %q{
    A library that provides an API for solving hands from the Krypto
    card game.  See http://en.wikipedia.org/wiki/Krypto_%28game%29
    for a description of Krypto.
  }
  spec.homepage      = "https://github.com/sortelli/rypto"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.5"
  spec.add_development_dependency "simplecov"
end
