class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @chats = @user.participants.where(status: true)
  end
end
