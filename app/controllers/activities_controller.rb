class ActivitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    if current_user.user_interests.empty?
      redirect_to user_interests_path
    else
      if params[:query].present?
        @activities = Activity.search_over_activities(params[:query])
      else
        @activities = current_user.activities
      end
    end
  end

  def show
    @activity = Activity.find(params[:id])
    @participant = Participant.new
    @events = Event.where(activity_id: @activity.id)
  end
end
