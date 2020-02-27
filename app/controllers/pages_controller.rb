class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  before_action :find_user

  def home
    if params[:query].present?
      @spots = Spot.search_by_title_and_description(params[:query])
    else
      @spots = Spot.all
    end
  end

  def find_user
    @user = current_user
  end

end
