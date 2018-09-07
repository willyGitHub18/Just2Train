class LocationsController < ApplicationController
  before_action :authenticate_user!
  def new
    @location = Location.new
    # Needed to seed the form with inputs of events
    @location.events.new
  end

  def create
    @location = Location.new(location_params)
    @location.save
  end

  private
    def location_params
      params.require(:location).permit(:category, :place_name, :street1, :street2, :city, :zip, events_attributes: [ :name, :price, :date, :nb_participant, :level, :time, :activity_id, :location_id ] )
    end
end
