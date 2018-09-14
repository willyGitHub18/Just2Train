class LocationsController < ApplicationController
    include ApplicationHelper

    before_action :authenticate_user!
    before_action :is_creator? , only: [:edit, :update, :destroy]
    before_action :is_administrator? , only: [:edit, :update]

    def new
      @location = Location.new
      # Needed to seed the form with inputs of events
      @location.events.new
    end

    def create
      @location = Location.new(location_params)
      @location.save
      create_participant
      flash[:success] = "Congrats, your event has been created"
      redirect_to event_path(@location.id)
    end

    def edit
      @location = Location.find(params[:id])
    end

    def update
      @location = Location.find(params[:id])
      if @location.update_attributes(location_params)
        flash[:success] = "Event updated"
        redirect_to events_path
      else
        render 'edit'
      end
    end

    def destroy
      Location.find(params[:id]).destroy
      flash[:success] = "Event deleted"
      redirect_to root_path
    end

  private
    def location_params
      params.require(:location).permit(:category, :place_name, :street1, :street2, :city, :zip, :latitude, :longitude, events_attributes: [ :id, :name, :price, :date, :nb_participant, :level, :time, :activity_id, :location_id ] )
    end
end
