class ActivitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: %I[index autocomplete]
  def index
    if params[:zone].present? || params[:query].present? 
      @activities = Activity.search({
        title_category: params[:query],
        zone: params[:zone]
      })
    elsif user_signed_in?
      @activities = Activity.where(id: current_user.user_interests.pluck(:activity_id))
    else
      @activities = Activity.all 
    end
  end

  def show
    @activity = Activity.find(params[:id])
    @participant = Participant.new
    @events = Event.where(activity_id: @activity.id)
  end

  def autocomplete
    @search_results = Activity.where("title ILIKE ?", "%#{params[:q]}%").pluck(:title)
    # @search_results = Activity.all.pluck(:title).select do |title|
    #   title.downcase.include? params[:q]
    # end
    render "activities/autocomplete", layout: false
  end
end
