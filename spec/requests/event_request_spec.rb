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

    it "displays the event's page" do
      get events_path
      expect(response).to render_template(:index)
    end

    it "does not render a different template" do
      get events_path
      expect(response).to_not render_template(:show)
    end
  end
end
