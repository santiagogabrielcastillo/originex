class UserInterestsController < ApplicationController

  def create
    current_user.user_interests.destroy_all
    user_interests_params[:activity_ids].each do |activity_id|
      UserInterest.create(activity_id: activity_id, user_id: current_user.id)
    end
    redirect_to activities_path 
  end

  private

  def user_interests_params
    params.require(:user).permit(activity_ids:[])
  end
end
