require "rails_helper"

RSpec.describe "Event request", :type => :request do
  # Need to have models really stored in the databse, when the DB are not populated this is false so we need to create those occurence
  let(:location) { Location.create(street1: "some_street", city: "some_city", zip: "some_zipcode") }
  let(:activity) { Activity.create(activity_name: "some_activity") }

  describe "Rendering views" do
    it "displays the page with all the events" do
      get events_path
      expect(response).to render_template(:index)
    end

    it "does not render a different template" do
      get events_path
      expect(response).to_not render_template(:show)
    end
  end

  describe "User can create an event and renders the event's page" do
    it "creates an event and redirects to the event's page" do
      get new_event_path
      expect(response).to render_template(:new)

      post '/events', params: { name: "some_name", date: "2001-12-03", time: "2015-12-08 10:26:40 -0200", location_id: location.id, activity_id: activity.id }

      expect(response).to redirect_to(assigns(:event))
      follow_redirect!

      expect(response).to render_template(:show)
      expect(response.body).to include("Event was successfully created!")
    end

    it "does not render a different template" do
      get event_path
      expect(response).to_not render_template(:index)
    end
  end
end
