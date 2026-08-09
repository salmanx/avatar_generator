# frozen_string_literal: true

require "spec_helper"

RSpec.describe AvatarGenerator::Generator do
  describe "#call" do
    subject(:image) do
      described_class
        .new(
          "user@example.com"
        )
        .call
    end

    it "returns Image object" do
      expect(image)
        .to be_a(
          AvatarGenerator::Image
        )
    end

    it "generates RGB color" do
      expect(
        image.color.length
      ).to eq(3)
    end

    it "generates pixel map" do
      expect(
        image.pixel_map
      ).not_to be_empty
    end
  end
end
