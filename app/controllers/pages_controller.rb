class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    if params[:query].present?
      @spots = Spot.search_by_title_and_description(params[:query])
    else
      @spots = Spot.all
    end
  end
end
