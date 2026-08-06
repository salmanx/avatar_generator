# frozen_string_literal: true

module Gravatar
  module Configuration
    class << self
      attr_accessor :size,
                    :grid_size,
                    :background,
                    :storage_path,
                    :public_path

      def reset!
        @size = 250
        @grid_size = 5
        @background = ChunkyPNG::Color::WHITE
        @storage_path = "public/avatars"
        @public_path = "/avatars"
      end
    end

    reset!
  end
end
