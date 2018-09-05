class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def create
    chosen_activity = Activity.find(params[:activity_id])
    chosen_location = Location.find(params[:location_id])

    @event = Event.new
    @event.activity = chosen_activity
    @event.location = chosen_location
    @event.save
    redirect_to event_path
  end

  private
    def event_params
      params.require(:event).permit(:name, :price, :date, :nb_participant, :level, :time, :activity_id, :location_id)
    end
end
