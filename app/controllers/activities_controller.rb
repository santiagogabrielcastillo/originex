class ActivitiesController < ApplicationController
  def index
    if params[:query].present?
      @activities = Activity.search_over_activities(params[:query])
    else
      @activities = Activity.all
    end
  end
end
