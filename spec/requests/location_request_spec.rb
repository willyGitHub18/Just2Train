require "rails_helper"

RSpec.describe "Event request", :type => :request do
  # Need to have models really stored in the databse, when the DB are not populated this is false so we need to create those occurence
  let(:location) { Location.create(street1: "some_street", city: "some_city", zip: "some_zipcode") }
  let(:activity) { Activity.create(activity_name: "some_activity") }

  describe "Rendering views" do
    it "displays the page with a event creation form" do
      get new_location_path
      expect(response).to render_template(:new)
    end

    it "does not render a different template" do
      get new_location_path
      expect(response).to_not render_template(:index)
    end
  end

  describe "User can create an event and renders the event's page" do
    it "creates an event and redirects to the root" do
      get new_location_path
      expect(response).to render_template(:new)

      location = Location.create(street1: "some_street", city: "some_city", zip: "some_zipcode", events_attributes: [ name: "some_name", date: "2001-12-03", time: "2015-12-08 10:26:40 -0200", location_id: 4, activity_id: 4 ] )
      expect(assigns(:location)).to be_a_new(Location)

      expect(response).to be_successful
    end
  end
end
