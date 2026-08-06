# frozen_string_literal: true

module Gravatar
  class Renderer
    def self.render(image)
      size =
        Configuration.size

      png =
        ChunkyPNG::Image.new(
          size,
          size,
          Configuration.background
        )

      color =
        ChunkyPNG::Color.rgb(
          *image.color
        )

      image.pixel_map.each do |rectangle|
        top_left,
        bottom_right = rectangle

        x1, y1 = top_left
        x2, y2 = bottom_right

        (x1..x2).each do |x|
          (y1..y2).each do |y|
            png[x, y] = color
          end
        end
      end

      png
    end
  end
end
