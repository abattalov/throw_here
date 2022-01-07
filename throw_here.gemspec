# frozen_string_literal: true

require_relative "lib/throw_here/version"

Gem::Specification.new do |spec|
  spec.name          = "throw_here"
  spec.version       = ThrowHere::VERSION
  spec.authors       = ["abattalov"]
  spec.email         = ["abattalov14@gmail.com"]

  spec.summary       = "This gem finds disc golf courses in the United States based on user input of state."
  spec.description   = "Update later"
  spec.homepage      = "https://www.pdga.com"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.4.0"

  spec.metadata["allowed_push_host"] = "https://mygemserver.com"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/abattalov/throw_here"
  spec.metadata["changelog_uri"] = "https://github.com/abattalov/throw_here"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"
  spec.add_dependency "nokogiri"
  spex.add_dependency "open-uri"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
