require 'rails_helper'

RSpec.describe UserActivity, type: :model do
  # Use of reflect_on_association method which will return information about the given association
  describe "Associations" do
    it "belongs to an activity" do
      assc = described_class.reflect_on_association(:activity)
      expect(assc.macro).to eq :belongs_to
    end

    it "belongs to a user" do
      assc = described_class.reflect_on_association(:user)
      expect(assc.macro).to eq :belongs_to
    end
  end
end
