class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @users = User.all
    @conversations = Conversation.all
  end

  private
    def event_params
      params.require(:event).permit(:name, :price, :date, :nb_participant, :level, :time, :activity_id, :location_id)
    end
end
