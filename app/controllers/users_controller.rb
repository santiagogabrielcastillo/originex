class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @chats = @user.participants.where(status: true)
    render "devise/show"
  end

  def age
    now = Time.current
    dob = @user.birthday
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end

  helper_method :age
end
