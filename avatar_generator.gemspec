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

  gemspec = File.basename(__FILE__)

  spec.files = IO.popen(
    %w[git ls-files -z],
    chdir: __dir__,
    err: IO::NULL
  ) do |ls|
    ls.readlines("\x0", chomp: true).reject do |file|
      file == gemspec ||
        file.end_with?(".gem") ||
        file.start_with?(
          *%w[
            bin/
            Gemfile
            .gitignore
            .rspec
            spec/
            .github/
            .rubocop.yml
          ]
        )
    end
  end

  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) do |file|
    File.basename(file)
  end

  spec.require_paths = ["lib"]

  # Runtime dependencies
  spec.add_dependency "base64"
  spec.add_dependency "chunky_png"
end
