require_relative 'lib/twitter_one_to_many/version'

Gem::Specification.new do |spec|
  spec.name          = "twitter_one_to_many"
  spec.version       = TwitterOneToMany::VERSION
  spec.authors       = ["Dakota L Martinez"]
  spec.email         = ["dakotaleemusic@gmail.com"]

  spec.summary       = %q{One to Many Exercise}
  spec.description   = %q{Learn about the single source of truth in object relationships}
  spec.homepage      = "https://github.com/DakotaLMartinez/twitter_one_to_many"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  # spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
