# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'redis_basement/version'

Gem::Specification.new do |spec|
  spec.name          = "redis_basement"
  spec.version       = RedisBasement::VERSION
  spec.authors       = ["Nathan Marley"]
  spec.email         = ["nathan.marley@gmail.com"]
  spec.summary       = %q{Cache web pages in Redis.}
  spec.description   = %q{Don't go out for cached pages. Fetch them from the basement instead. Useful for development.}
  spec.homepage      = "http://github.com/nmarley/redis_basement"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "redis", "~> 3.0"

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake", "~> 0"
end
