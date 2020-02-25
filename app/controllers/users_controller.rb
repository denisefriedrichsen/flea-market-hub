class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    authorize @spot
    @booking = Booking.new
  end

  def edit

  end

  def update
  end

  def destroy
  end
end
