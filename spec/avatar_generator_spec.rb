# frozen_string_literal: true

require "spec_helper"

RSpec.describe AvatarGenerator do
  describe ".generate" do
    it "returns an Avatar object" do
      avatar =
        AvatarGenerator.generate(
          "jane@example.com"
        )

      expect(avatar)
        .to be_a(AvatarGenerator::Avatar)
    end

    it "generates same avatar for same identifier" do
      avatar1 =
        AvatarGenerator.generate(
          "jane@example.com"
        )

      avatar2 =
        AvatarGenerator.generate(
          "jane@example.com"
        )

      expect(
        avatar1.base64
      ).to eq(
        avatar2.base64
      )
    end

    it "generates different avatars for different identifiers" do
      avatar1 =
        AvatarGenerator.generate(
          "jane@example.com"
        )

      avatar2 =
        AvatarGenerator.generate(
          "john@example.com"
        )

      expect(
        avatar1.base64
      ).not_to eq(
        avatar2.base64
      )
    end
  end
end
