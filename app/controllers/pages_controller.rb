class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    if params[:query].present?
      @activities = Activity.search_over_title_and_cateogry(params[:query])
    else
      @activities = Activity.all
    end
  end
end
