class ChatroomsController < ApplicationController
  before_action :set_activity, only: %i[new create]
  def new
    @users = @activity.users
    @chatroom = Chatroom.new
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)
    @chatroom.activity = @activity
    if @chatroom.save
      redirect_to chatroom_path(@chatroom)
    else
      render :new
    end
  end

  def show
    @message = Message.new
    @chatroom = Chatroom.find(params[:id])
  end

  private

  def set_activity
    @activity = Activity.find(params[:activity_id])
  end

  def chatroom_params
    params.require(:chatroom).permit(:title, :description)
  end
end
