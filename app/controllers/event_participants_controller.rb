class EventParticipantsController < ApplicationController
  def create

  end

  private
  def event_participants_params
    params.require(:event_participant).permit(:is_creator, :is_admin, :event_id, :user_id)
  end
end
