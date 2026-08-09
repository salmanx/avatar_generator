# frozen_string_literal: true

require "spec_helper"

RSpec.describe AvatarGenerator::Avatar do
  let(:avatar) do
    AvatarGenerator.generate(
      "user@example.com"
    )
  end

  describe "#image" do
    it "creates png image" do
      expect(
        avatar.image
      ).to be_a(
        ChunkyPNG::Image
      )
    end
  end

  describe "#blob" do
    it "returns png binary data" do
      expect(
        avatar.blob
      ).to be_a(
        String
      )

      expect(
        avatar.blob
      ).to start_with(
        "\x89PNG".b
      )
    end
  end

  describe "#io" do
    it "returns StringIO" do
      expect(
        avatar.io
      ).to be_a(
        StringIO
      )
    end
  end

  describe "#base64" do
    it "returns encoded string" do
      expect(
        avatar.base64
      ).to be_a(
        String
      )

      expect(
        avatar.base64.length
      ).to be > 0
    end
  end

  describe "#data_url" do
    it "returns browser compatible image url" do
      expect(
        avatar.data_url
      ).to start_with(
        "data:image/png;base64,"
      )
    end
  end
end
