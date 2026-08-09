# frozen_string_literal: true

require_relative "gravatar/version"

require "digest/md5"
require "base64"
require "stringio"
require "chunky_png"
require "fileutils"

require_relative "gravatar/configuration"
require_relative "gravatar/image"
require_relative "gravatar/generator"
require_relative "gravatar/renderer"
require_relative "gravatar/avatar"
module Gravatar
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
