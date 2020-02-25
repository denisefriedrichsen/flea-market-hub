class BookingsController < ApplicationController

def index
  @bookings = Booking.where(user_id == current_user.id)
end

def show
  @booking = Booking.find(params[:id])
end

def new
  @booking = Booking.new
end

def create
  @booking = Booking.new(booking_params)
  @booking.user_id == current_user
  @booking.spot_id == set_spot
  if @booking.save
    redirect_to bookings_path
  else
    render :new
  end
end

def destroy
  @booking.delete
  redirect_to bookings_path
end

private

def booking_params
  params.require(:booking).permit(:date)
end

def set_spot
    @spot = Spot.find(params[:id])
  end

end
