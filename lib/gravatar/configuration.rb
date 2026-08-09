# frozen_string_literal: true

module Gravatar
  class Configuration
    attr_accessor :size,
                  :background,
                  :storage_path,
                  :public_path

    def initialize
      @size = 250
      @background = "#FFFFFF"
      @storage_path = "public/avatars"
      @public_path = "/avatars"
    end
  end
end
