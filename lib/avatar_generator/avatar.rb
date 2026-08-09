# frozen_string_literal: true

module AvatarGenerator
  class Avatar
    def initialize(image, identifier:)
      @image_data = image
      @identifier = identifier
    end

    def image
      @image ||= Renderer.render(@image_data)
    end

    def save(filename = nil)
      filename ||= self.filename
      filename = "#{filename}.png" if File.extname(filename).empty?

      raise ArgumentError, "filename must have .png extension" unless File.extname(filename).downcase == ".png"

      file_path = File.join(
        AvatarGenerator.configuration.storage_path,
        filename
      )

      FileUtils.mkdir_p(
        File.dirname(file_path)
      )

      image.save(file_path)

      file_path
    end

    def path
      File.join(
        AvatarGenerator.configuration.storage_path,
        filename
      )
    end

    def url
      File.join(
        AvatarGenerator.configuration.public_path,
        filename
      )
    end

    def filename
      "#{identifier_hash}.png"
    end

    def blob
      image.to_blob
    end

    def io
      StringIO.new(blob)
    end

    def base64
      Base64.strict_encode64(blob)
    end

    def data_url
      "data:image/png;base64,#{base64}"
    end

    private

    def identifier_hash
      Digest::MD5.hexdigest(
        @identifier.downcase.strip
      )
    end
  end
end
