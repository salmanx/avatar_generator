# frozen_string_literal: true

module Gravatar
  class Avatar
    def initialize(image, identifier:)
      @image = image
      @identifier = identifier
    end

    def image
      @image ||= Renderer.render(@image)
    end

    def save(filename = nil)
      FileUtils.mkdir_p(
        File.dirname(path)
      )

      image.save(
        filename || path
      )
    end

    def path
      File.join(
        Configuration.storage_path,
        filename
      )
    end

    def url
      File.join(
        Configuration.public_path,
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
