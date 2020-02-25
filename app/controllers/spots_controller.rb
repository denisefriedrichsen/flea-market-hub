class SpotsController < ApplicationController

  def index
    @spots = Spot.all
    # authorize @spots
  end

  def show
    @spot = Spot.find(params[:id])
    # authorize @spot
  end

  def new
    @spot = Spot.new
    # authorize @spot
  end

  def create
    @spot = Spot.new(spot_params)
    # authorize @spot
    if @spot.save
      redirect_to spot_path(@spot)
    else
      render 'new'
    end
  end


  private

  def spot_params
    params.require(:spot).permit(:title)
  end
end
