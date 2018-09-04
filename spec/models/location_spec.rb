require 'rails_helper'

RSpec.describe Location, type: :model do
  # Use of subject method so the tests will apply to the subject
  subject{ described_class.new(street1: "some_street", city: "some_city", zip: "some_zipcode") }

  describe "Validation" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a street" do
      subject.street1 = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a city" do
      subject.city = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a zipcode" do
      subject.zip = nil
      expect(subject).to_not be_valid
    end
  end
end
