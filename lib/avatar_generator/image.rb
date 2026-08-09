# frozen_string_literal: true

module AvatarGenerator
  Image = Struct.new(
    :color,
    :pixel_map,
    :image_size,
    :background,
    keyword_init: true
  )
end
