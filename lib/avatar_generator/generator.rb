# frozen_string_literal: true

module AvatarGenerator
  class Generator
    GRID_SIZE = 5
    def initialize(identifier, size: nil, background: nil)
      @identifier = identifier
      @image_size = size || AvatarGenerator.configuration.size
      @background = background || AvatarGenerator.configuration.background

      raise ArgumentError, "image size must be at least 5" if @image_size < 5
    end

    def call
      bytes = Digest::MD5.digest(@identifier).bytes

      color =
        bytes.first(3)

      grid =
        bytes
        .each_slice(3)
        .select { |row| row.length == 3 }
        .map { |row| mirror_row(row) }
        .flatten
        .each_with_index
        .select { |code, _| code.even? }

      pixel_map =
        grid.map do |_, index|
          cell =
            @image_size / GRID_SIZE

          x =
            (index % GRID_SIZE) * cell

          y =
            (index / GRID_SIZE) * cell

          [
            [x, y],
            [x + cell - 1, y + cell - 1]
          ]
        end

      Image.new(
        color: color,
        image_size: @image_size,
        pixel_map: pixel_map,
        background: @background
      )
    end

    private

    def mirror_row(row)
      row + [
        row[1],
        row[0]
      ]
    end
  end
end
