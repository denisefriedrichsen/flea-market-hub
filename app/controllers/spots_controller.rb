class SpotsController < ApplicationController
  # skip_after_action :verify_policy_scope, only: :index, unless: :skip_pundit?
  before_action :find_user

  def find_user
    @user = current_user
  end

  def index
    @spots = policy_scope(Spot).order(created_at: :desc)
    @spots = Spot.geocoded

    if params[:query].present?
      @spots = Spot.search_by(params[:query])
    else
      @spots = Spot.all
    end

    @markers = @spots.map do |spot|
      {
        lat: spot.latitude,
        lng: spot.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { spot: spot }),
        image_url: helpers.asset_url('flea-market-2.jpeg')
      }
    end
  end

  def indexMySpots
    @my_spots = current_user.spots
    authorize @my_spots
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
    @spot = Spot.find(params[:id])
    authorize @spot
  end

  def update
    @spot = Spot.find(params[:id])
    authorize @spot
  end

  def destroy
    @spot = Spot.find(params[:id])
    authorize @spot
    @spot.destroy
    redirect_to spots_path
  end


  private

  def spot_params
    params.require(:spot).permit(:title, :price, :description, :address, :body, :photo)
  end
end
