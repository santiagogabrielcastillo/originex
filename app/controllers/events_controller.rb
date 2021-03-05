class EventsController < ApplicationController
  before_action :set_chatroom, only: %i[new create]
  def index
  end

  def show
    @event = Event.find(params[:id])
    @participant = Participant.new
    @participants = Participant.where(@participant.chatroom == @event.chatroom)

    @markers = [{
      lat: @event.latitude,
      lng: @event.longitude
    }]
  end

  def new
    @event = Event.new
    @users = @chatroom.users
  end

  def create
    @event = Event.new(event_params)
    @event.chatroom = @chatroom
    @event.activity = @chatroom.activity
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
    params.require(:event).permit(:details, :status, :date, :address)
  end
end
