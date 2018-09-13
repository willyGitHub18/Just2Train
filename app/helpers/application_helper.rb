module ApplicationHelper
  # Helper in order to add the creator of an event as participant
  def create_participant
    current_event = Event.last

    @event_participant = EventParticipant.new
    @event_participant.user = current_user
    @event_participant.event = current_event
    @event_participant.save
  end

  def is_creator?
    unless @current_user.is_creator == true
      flash[:danger] = "Nice try but you're not the creator of the event"
      redirect_to event_path(:id)
    end
  end

  def is_administrator?
    unless @current_user.is_admin == true
      flash[:danger] = "You cannot pass! Ask Gandalf"
      redirect_to event_path(:id)
    end
  end
end
