class BookingsController < ApplicationController
  before_action :set_spot, only: [:create]
  before_action :find_user

  def find_user
    @user = current_user
  end

  def index
    @spots = policy_scope(Spot).order(created_at: :desc)
    @bookings = current_user.bookings
  end

   def show
     @booking = Booking.find(params[:id])
     authorize @booking
   end

   def decline
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.status = "declined"
    @booking.save!
     redirect_to myspots_path

  end

   def confirm
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.status = "confirmed"
    @booking.save!
     redirect_to myspots_path
   end

   def new
     @booking = Booking.new
   end

  def create
    @booking = Booking.new(booking_params)
    authorize @spot
    @booking.spot = @spot
    @booking.user = current_user
    if @booking.save
      authorize @spot
      redirect_to bookings_path
    else
      authorize @spot
      render 'spots/show'
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    #authorize @spot
    authorize @booking
    @booking.delete
    redirect_to bookings_path
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
