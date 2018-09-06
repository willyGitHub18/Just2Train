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
    it "creates an event and redirects to the event's page" do
      get new_location_path
      expect(response).to render_template(:new)

      post '/locations', params: { :category, :place_name, :street1, :street2, :city, :zip, events_attributes: [ :name, :price, :date, :nb_participant, :level, :time, :activity_id, :location_id ] }

      expect(response).to redirect_to(assigns(:locations))
      follow_redirect!

      expect(response).to render_template(:show)
      expect(response.body).to include("Event was successfully created!")
    end
  end
end
