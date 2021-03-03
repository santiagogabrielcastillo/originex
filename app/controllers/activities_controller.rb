class ActivitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    if current_user.user_interests.empty?
      redirect_to user_interests_path
    else
      if params[:query].present?
        @activities = Activity.search_over_activities(params[:query])
      else
        current_user.user_interests.each do |interest|
          @activities = Activity.where(id: interest.activity_id)
        end
      end
    end
  end

  def show
    @activity = Activity.find(params[:id])
    @events = Event.where(activity_id: @activity.id)
  end
end
