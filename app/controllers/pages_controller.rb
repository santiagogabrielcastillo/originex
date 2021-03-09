class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    if params[:zone].present? || params[:query].present? 
      @activities = Activity.search({
        title_category: params[:query],
        zone: params[:zone]
      })
    else
      @activities = Activity.all
    end
  end
end
