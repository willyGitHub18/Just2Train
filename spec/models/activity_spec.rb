require 'rails_helper'

RSpec.describe Activity, type: :model do
  # Use of subject method so the tests will apply to the subject
  subject{ described_class.new(activity_name: "some_activity") }

  describe "Validation" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a type" do
      subject.activity_name = nil
      expect(subject).to_not be_valid
    end
  end

  # Use of reflect_on_association method which will return information about the given association
  describe "Associations" do
    it "has many events" do
      assc = described_class.reflect_on_association(:events)
      expect(assc.macro).to eq :has_many
    end

    it "has many user activities" do
      assc = described_class.reflect_on_association(:user_activities)
      expect(assc.macro).to eq :has_many
    end

    it "has many users" do
      assc = described_class.reflect_on_association(:users)
      expect(assc.macro).to eq :has_many
    end
  end
end
