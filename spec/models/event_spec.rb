require 'rails_helper'

RSpec.describe Event, type: :model do
  # Need to have models really stored in the databse, when the DB are not populated this is false so we need to create those occurence
  let(:location) { Location.create(street1: "some_street", city: "some_city", zip: "some_zipcode") }
  let(:activity) { Activity.create(activity_name: "some_activity") }
  # Use of subject method so the tests will apply to the subject

  subject{ described_class.new(name: "some_name", date: "2001-12-03", time: "2015-12-08 10:26:40 -0200", location_id: location.id, activity_id: activity.id) }

  describe "Validation" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a date" do
      subject.date = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a time" do
      subject.time = nil
      expect(subject).to_not be_valid
    end
  end

  # Use of reflect_on_association method which will return information about the given association
  describe "Associations" do
    it "has many event participants" do
      assc = described_class.reflect_on_association(:event_participants)
      expect(assc.macro).to eq :has_many
    end

    it "has many users" do
      assc = described_class.reflect_on_association(:users)
      expect(assc.macro).to eq :has_many
    end

    it "belongs to a location" do
      assc = described_class.reflect_on_association(:location)
      expect(assc.macro).to eq :belongs_to
    end

    it "belongs to an activity" do
      assc = described_class.reflect_on_association(:activity)
      expect(assc.macro).to eq :belongs_to
    end
  end
end
