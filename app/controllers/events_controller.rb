class EventsController < ApplicationController
  def index
  end

  def show
    @event = Event.find(params[:id])

    @markers = [{
      lat: @event.latitude,
      lng: @event.longitude
    }]
  end

  def new
    @chatroom = Chatroom.find(params[:chatroom_id])
    @event = Event.new
  end
end
