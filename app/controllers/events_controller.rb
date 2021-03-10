class EventsController < ApplicationController
  before_action :set_chatroom, only: %i[new create]
  def index
  end

  def show
    @event = Event.find(params[:id])
    @date = Date.parse(@event.date.to_s.split[0])
    @time = @event.date.to_s.split[1]
    @participants = @event.chatroom.participants.where(status: true)
    @participant = Participant.new
    @user_participant = Participant.where('user_id = ? and chatroom_id = ?', current_user.id, @event.chatroom.id)
    @markers = [{
      lat: @event.latitude,
      lng: @event.longitude
    }]
  end

  def new
    @event = Event.new
    @participants = @chatroom.participants.where(status: true)
  end

  def create
    @event = Event.new(event_params)
    @event.chatroom = @chatroom
    @event.activity = @chatroom.activity
    @participants = @chatroom.participants.where(status: true)
    if @event.save
      redirect_to activity_event_path(@event.activity, @event)
    else
      render :new
    end
  end

  private

  def set_chatroom
    @chatroom = Chatroom.find(params[:chatroom_id])
  end

  def event_params
    params.require(:event).permit(:details, :status, :date, :address, :photo)
  end
end
