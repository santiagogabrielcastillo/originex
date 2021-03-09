class ParticipantsController < ApplicationController
  before_action :set_invitation, only: %I[update destroy]
  def index
    raise
    @invitations = Participant.where(["user_id = ? and status= ?", current_user.id, false]).includes(:chatroom, :user)
  end

  def create
    @event = Event.find(params[:event_id])
    @participant = Participant.new
    @participant.user = current_user
    @participant.chatroom = @event.chatroom
    @participant.status = "true"
    if @participant.save
      redirect_to chatroom_path(@event.chatroom)
    else
      render "events/show", object: @event      
    end
  end

  def update
    @invitation.status = true
    if @invitation.save
      redirect_to chatroom_path(@invitation.chatroom)
    else
      render :index
    end
  end
  
  def destroy
    @invitation.destroy
    redirect_to participants_path
  end
  
  private
  
  def set_invitation
    @invitation = Participant.find(params[:id])
  end
end
