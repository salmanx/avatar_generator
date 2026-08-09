# frozen_string_literal: true

require "rails/generators"

module AvatarGenerator
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc "Creates a Gravatar initializer."

      source_root File.expand_path("templates", __dir__)

      def create_initializer
        template(
          "avatar_generator.rb",
          "config/initializers/avatar_generator.rb"
        )
      end
    end
  end
end
