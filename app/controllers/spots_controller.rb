class SpotsController < ApplicationController

  def index
    @spots = policy_scope(Spot).order(created_at: :desc)
  end

  def show
    @spot = Spot.find(params[:id])
    @booking = Booking.new
    authorize @spot
  end

  def new
    @spot = Spot.new
    authorize @spot
  end

  def create
    @spot = Spot.new(spot_params)
    authorize @spot
    @spot.availability == true
    @spot.user = current_user
    if @spot.save
      redirect_to @spot
    else
      render 'new'
    end
  end

  def destroy
    @spot = Spot.find(params[:id])
    authorize @spot
    @spot.destroy
    redirect_to spots_path
  end


  private

  def spot_params
    params.require(:spot).permit(:title, :price, :description)
  end
end
