class BookingsController < ApplicationController
  before_action :set_spot, only: [:create]

def index
  @spots = policy_scope(Spot).order(created_at: :desc)
  @bookings = current_user.bookings
end

 def show
   @booking = Booking.find(params[:id])
   authorize @booking
 end

 def new
   @booking = Booking.new
 end

def create
  @booking = Booking.new(booking_params)
  authorize @spot
  @booking.spot = @spot
  @booking.user = current_user
   #@booking.status = "open"
  if @booking.save!
    authorize @spot
    redirect_to bookings_path
  else
    authorize @spot
    render 'spots/show'
  end
end

def destroy
  @booking = Booking.find(params[:id])
  @booking.delete
  redirect_to bookings_path
  authorize @booking
end

private

  def booking_params
    params.require(:booking).permit(:date)
  end

  def set_spot
    @spot = Spot.find(params[:spot_id])
    authorize @spot
  end

end
