class ActivitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    if params[:query].present?
      @activities = Activity.search_over_activities(params[:query])
    elsif user_signed_in?
      @activities = current_user.activities
    else
     @activities = Activity.all 
    end
  end

  def show
    @activity = Activity.find(params[:id])
    @participant = Participant.new
    @events = Event.where(activity_id: @activity.id)
  end
end
