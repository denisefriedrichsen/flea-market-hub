class SpotsController < ApplicationController

  def index
    @spots = policy_scope(Spot).order(created_at: :desc)
    @spots = Spot.geocoded
    @markers = @spots.map do |spot|
      {
        lat: spot.latitude,
        lng: spot.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { spot: spot })
      }
    end
  end

  def indexMySpots
    @spots = policy_scope(Spot).order(created_at: :desc)
    authorize @spots
    @my_spots = current_user.spots
  end

  def show
    @spot = Spot.find(params[:id])
    authorize @spot
    @booking = Booking.new
  end

  def new
    @spot = Spot.new
    authorize @spot
  end

  def create
    @spot = Spot.new(spot_params)
    authorize @spot
    @spot.availability = true
    @spot.user_id = current_user
    @spot.availability == true
    @spot.user = current_user
    if @spot.save
      redirect_to @spot
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @spot = Spot.find(params[:id])
    authorize @spot
    @spot.destroy
    redirect_to spots_path
  end


  private

  def spot_params
    params.require(:spot).permit(:title, :price, :description, :body, :photo)
    # params.require(:spot).permit(:title, :price, :description)
    # params.require(:spot).permit(:title, :body, :photo)
  end
end
