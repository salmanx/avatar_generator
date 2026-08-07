# frozen_string_literal: true

require "spec_helper"

RSpec.describe Gravatar do
  describe ".generate" do
    it "returns an Avatar object" do
      avatar =
        Gravatar.generate(
          "salman@example.com"
        )

      expect(avatar)
        .to be_a(Gravatar::Avatar)
    end

    it "generates same avatar for same identifier" do
      avatar1 =
        Gravatar.generate(
          "salman@example.com"
        )

      avatar2 =
        Gravatar.generate(
          "salman@example.com"
        )

      expect(
        avatar1.base64
      ).to eq(
        avatar2.base64
      )
    end

    it "generates different avatars for different identifiers" do
      avatar1 =
        Gravatar.generate(
          "salman@example.com"
        )

      avatar2 =
        Gravatar.generate(
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
