class LocationsController < ApplicationController
  def new
    @location = Location.new
    # Needed to seed the form with inputs of events
    @location.events.new
  end

  def create
    @location = Location.new(location_params)
    @location.save
    flash[:success] = "Congrats, your event has been created"
    redirect_to 'root_url'
  end

  private
    def location_params
      params.require(:location).permit(:category, :place_name, :street1, :street2, :city, :zip, events_attributes: [ :name, :price, :date, :nb_participant, :level, :time, :activity_id, :location_id ] )
    end
end
