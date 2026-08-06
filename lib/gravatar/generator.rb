# frozen_string_literal: true

module Gravatar
  class Generator
    def initialize(identifier, size: nil)
      @identifier = identifier
      @size = size || Configuration.size
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
            @size / Configuration.grid_size

          x =
            (index % Configuration.grid_size) * cell

          y =
            (index / Configuration.grid_size) * cell

          [
            [x, y],
            [x + cell - 1, y + cell - 1]
          ]
        end

      Image.new(
        color: color,
        pixel_map: pixel_map
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
