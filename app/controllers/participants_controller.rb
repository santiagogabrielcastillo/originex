class ParticipantsController < ApplicationController
  def index
    @invitations = Participant.where(["user_id = ? and status= ?", current_user.id, "false"])
    @participants = Participant.where(["chatroom_id = ? and status= ?", @participant.chatroom.id, "true"])
  end
end
