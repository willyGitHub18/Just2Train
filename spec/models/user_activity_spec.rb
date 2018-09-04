require 'rails_helper'

RSpec.describe UserActivity, type: :model do
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
