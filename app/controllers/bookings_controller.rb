class BookingsController < ApplicationController
  before_action :set_spot, only: [:create]

# def index
#   @bookings = Booking.where(user_id == current_user.id)
# end

# def show
#   @booking = Booking.find(params[:id])
# end

# def new
#   @booking = Booking.new
# end

def create
  @booking = Booking.new(booking_params)
  @booking.spot = @spot
  @booking.user_id = User.first.id
  @booking.status = "open"
  if @booking.save!
    redirect_to spot_path(@spot)
  else
    render 'spots/show'
  end
end

def destroy
  @booking = Booking.find(params[:id])
  @booking.delete
  redirect_to bookings_path
end

private

  def booking_params
    params.require(:booking).permit(:date)
  end

  def set_spot
      @spot = Spot.find(params[:spot_id])
  end

end
