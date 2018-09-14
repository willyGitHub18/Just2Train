class EventParticipantsController < ApplicationController

  def create
    chosen_event = Event.find(params[:event_id])

    # Counting the number of participants already registered to a particular event
    registered = EventParticipant.where(event_id: chosen_event.id).count

    if chosen_event.nb_participant == registered
      flash[:notice] = "Sorry the event is booked up but you can still organize your own event"
      redirect_to new_location_path
    else
      @event_participant = EventParticipant.new
      @event_participant.user = current_user
      @event_participant.event = chosen_event
      @event_participant.is_creator = false
      @event_participant.is_admin = false

      if @event_participant.save
        flash[:notice] = "Thank you your are now registered. We are counting on your presence ;)"
        redirect_to events_path
      else
        flash.now[:warning] = "A problem occured while you submit your registration, please try again"
        render event_path(chosen_event)
      end
    end
  end

  private
  def event_participants_params
    params.require(:event_participant).permit(:is_creator, :is_admin, :event_id, :user_id)
  end
end
