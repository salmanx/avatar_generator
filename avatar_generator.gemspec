# frozen_string_literal: true

require_relative "lib/avatar_generator/version"

Gem::Specification.new do |spec|
  spec.name = "avatar_generator"
  spec.version = AvatarGenerator::VERSION

  spec.authors = ["Salman Mahmud"]
  spec.email = ["salmanmahmud2014@gmail.com"]

  spec.summary = "Github style avatar generator for Ruby applications"
  spec.description = <<~DESCRIPTION
    avatar_generator is a github style deterministic avatar generator for Ruby applications.
    It generates unique, consistent avatars from identifiers such as
    usernames, email addresses, or other unique values. The same identifier
    always produces the same avatar.
  DESCRIPTION

  spec.homepage = "https://github.com/salmanx/avatar_generator"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.7.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] =
    "https://github.com/salmanx/avatar_generator"
  spec.metadata["changelog_uri"] =
    "https://github.com/salmanx/avatar_generator/releases"
  spec.metadata["bug_tracker_uri"] =
    "https://github.com/salmanx/avatar_generator/issues"
  spec.metadata["rubygems_mfa_required"] = "true"

  spec.files = Dir.chdir(__dir__) do
    Dir[
      "{lib,sig}/**/*",
      "README.md",
      "LICENSE.txt",
      "CHANGELOG.md",
      "CODE_OF_CONDUCT.md",
      "*.gemspec",
      "Rakefile",
    ]
  end

  spec.require_paths = ["lib"]

  # Runtime dependencies
  spec.add_dependency "base64"
  spec.add_dependency "chunky_png"
end