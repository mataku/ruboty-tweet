# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ruboty/tweet/version"

Gem::Specification.new do |spec|
  spec.name          = "ruboty-tweet"
  spec.version       = Ruboty::Tweet::VERSION
  spec.authors       = ["Takuma Homma"]
  spec.email         = ["sfprhythnn@gmail.com"]

  spec.summary       = "Post tweet"
  spec.description   = "Post tweet"
  spec.homepage      = "https://github.com/mataku/ruboty-tweet"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'ruboty'
  spec.add_runtime_dependency 'twitter'

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
