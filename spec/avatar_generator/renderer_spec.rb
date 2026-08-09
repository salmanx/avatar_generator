# frozen_string_literal: true

require "spec_helper"

RSpec.describe AvatarGenerator::Renderer do
  let(:image) do
    AvatarGenerator::Generator
      .new(
        "user@example.com"
      )
      .call
  end

  describe ".render" do
    subject(:png) do
      described_class.render(image)
    end

    it "returns ChunkyPNG image" do
      expect(png)
        .to be_a(
          ChunkyPNG::Image
        )
    end

    it "creates configured size image" do
      expect(
        png.width
      ).to eq(
        AvatarGenerator.configuration.size
      )

      expect(
        png.height
      ).to eq(
        AvatarGenerator.configuration.size
      )
    end
  end
end
