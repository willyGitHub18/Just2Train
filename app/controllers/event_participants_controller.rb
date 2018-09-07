class EventParticipantsController < ApplicationController
  def create
    chosen_event = Event.find(params[:event_id])

    @event_participant = EventParticipant.new
    @event_participant.user = current_user
    @event_participant.event = chosen_event

    if @event_participant.save
      flash[:notice] = "Thank you your are now registered. We are counting on your presence ;)"
      redirect_to root_path
    else
      flash.now[:warning] = "The seem to be problems when submitting your registration, please try again"
      render event_path
    end
  end

  private
  def event_participants_params
    params.require(:event_participant).permit(:is_creator, :is_admin, :event_id, :user_id)
  end
end
