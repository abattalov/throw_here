# frozen_string_literal: true

require_relative "lib/throw_here/version"

Gem::Specification.new do |spec|
  spec.name          = "throw_here"
  spec.version       = ThrowHere::VERSION
  spec.authors       = ["abattalov"]
  spec.email         = ["abattalov14@gmail.com"]

  spec.summary       = "This gem finds disc golf courses in the United States based on user input of state."
  spec.description   = "This gem scrapes the PDGA website for all of the courses in the United States. Then asks the user for a state for which they would like to get disc golf course information."
  spec.homepage      = "https://github.com/abattalov/throw_here"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.4.0"

  spec.metadata["allowed_push_host"] = "https://mygemserver.com"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/abattalov/throw_here"
  spec.metadata["changelog_uri"] = "https://github.com/abattalov/throw_here"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"
  spec.add_dependency "nokogiri"
  spec.add_dependency "open-uri"
  spec.add_dependency "progress_bar"

end
