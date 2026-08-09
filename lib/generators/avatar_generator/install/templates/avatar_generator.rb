# frozen_string_literal: true

# Gravatar configuration
#
# You can customize the default settings below.
# Individual avatars can override these settings when generated.

AvatarGenerator.configure do |config|
  # Default avatar size in pixels.
  config.size = 250

  # Default background color.
  config.background = "#FFFFFF"

  # Directory where generated avatars are stored.
  config.storage_path = "public/avatars"

  # Public URL path used to access generated avatars.
  config.public_path = "/avatars"
end
