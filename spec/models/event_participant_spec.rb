require 'rails_helper'

RSpec.describe EventParticipant, type: :model do
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
end
