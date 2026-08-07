# frozen_string_literal: true

module Gravatar
  module Configuration
    class << self
      attr_accessor :image_size,
                    :grid_size,
                    :background,
                    :storage_path,
                    :public_path

      def reset!
        @image_size = 250
        @grid_size = 5
        @background = "#FFFFFF"
        @storage_path = "public/avatars"
        @public_path = "/avatars"
      end
    end

    reset!
  end
end
