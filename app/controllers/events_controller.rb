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
    @event = Event.new(event_params)
    @event.save
    redirect_to event_path
  end

  private
    def event_params
      params.require(:event).permit(:name, :price, :date, :nb_participant, :level, :time, :activity_id, :location_id)
    end
end
