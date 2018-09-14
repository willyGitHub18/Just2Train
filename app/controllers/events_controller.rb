class EventsController < ApplicationController
  before_action :authenticate_user!

  def new
    @event = Event.new
  end

  def index
    @events = Event.all
  end

  def index_futsal
    @events = Event.all
  end

  def index_cyclism
    @events = Event.all
  end

  def index_running
    @events = Event.all
  end

  def index_basketball
    @events = Event.all
  end

  def index_football
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
