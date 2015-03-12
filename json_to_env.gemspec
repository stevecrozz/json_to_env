# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'json_to_env'

Gem::Specification.new do |spec|
  spec.name          = "json_to_env"
  spec.version       = JsonToEnv::VERSION
  spec.authors       = ["Stephen Crosby"]
  spec.email         = ["stevecrozz@gmail.com"]
  spec.summary       = %q{Load JSON config into your environment}
  spec.description   = %q{Take a list of JSON file names, and if they exist,
                          load the contents into your process environment.}
  spec.homepage      = "https://github.com/stevecrozz/json_to_env"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
