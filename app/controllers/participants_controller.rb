class ParticipantsController < ApplicationController
  def index
    @invitations = Participant.where(["user_id = ? and status= ?", current_user.id, "false"]).includes(:chatroom, :user)
  end
end
