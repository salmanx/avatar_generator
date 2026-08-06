# frozen_string_literal: true

module Gravatar
  Image = Struct.new(
    :color,
    :pixel_map,
    keyword_init: true
  )
end
