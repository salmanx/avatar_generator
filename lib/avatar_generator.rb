# frozen_string_literal: true

require_relative "avatar_generator/version"

require "digest/md5"
require "base64"
require "stringio"
require "chunky_png"
require "fileutils"

require_relative "avatar_generator/configuration"
require_relative "avatar_generator/image"
require_relative "avatar_generator/generator"
require_relative "avatar_generator/renderer"
require_relative "avatar_generator/avatar"
module AvatarGenerator
  class Error < StandardError; end

  class << self
    attr_reader :configuration

    def configure
      yield(configuration)
    end

    def generate(identifier, **options)
      image =
        Generator
        .new(identifier, **options)
        .call

      Avatar.new(
        image,
        identifier: identifier
      )
    end
  end
  @configuration = Configuration.new
end
