# frozen_string_literal: true

require "rails/generators"

module Gravatar
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc "Creates a Gravatar initializer."

      source_root File.expand_path("templates", __dir__)

      def create_initializer
        template(
          "gravatar.rb",
          "config/initializers/gravatar.rb"
        )
      end
    end
  end
end
