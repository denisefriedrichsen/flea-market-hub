class SpotsController < ApplicationController

  def index
    @spots = Spot.all
  end

  def show
    @spot = Spot.find(params[:id])
  end

  def new
    @spot = Spot.new
  end

  def create
    @spot = Spot.new(spot_params)
    @spot.availability == true
    @spot.user_id == current_user
    if @spot.save
      redirect_to spot_path(@spot)
    else
      render 'new'
    end
  end


  private

  def spot_params
    params.require(:spot).permit(:title, :price, :description, :user_id)
  end
end
