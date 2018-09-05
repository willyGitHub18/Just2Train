require 'rails_helper'

RSpec.describe EventParticipant, type: :model do
  # Use of reflect_on_association method which will return information about the given association
  describe "Associations" do
    it "belongs to an event" do
      assc = described_class.reflect_on_association(:event)
      expect(assc.macro).to eq :belongs_to
    end

    it "belongs to a user" do
      assc = described_class.reflect_on_association(:user)
      expect(assc.macro).to eq :belongs_to
    end
  end
end
