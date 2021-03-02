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
      params[:chatroom]["user_ids"].reject(&:blank?).map { |a| a.to_i }.each do |user_id|
        @participant = Participant.create(user_id: user_id, chatroom_id: @chatroom.id, status: "false")
      end
      @participant = Participant.create(user_id: current_user.id, chatroom_id: @chatroom.id, status: "true")
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
    params.require(:chatroom).permit(:title, :description, :participants)
  end
end
