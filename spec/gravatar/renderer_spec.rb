# frozen_string_literal: true

require "spec_helper"

RSpec.describe Gravatar::Renderer do
  let(:image) do
    Gravatar::Generator
      .new(
        "salman@example.com"
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
        Gravatar::Configuration.image_size
      )

      expect(
        png.height
      ).to eq(
        Gravatar::Configuration.image_size
      )
    end
  end
end
