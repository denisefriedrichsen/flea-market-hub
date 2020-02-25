class UsersController < ApplicationController
  before_action :find_user, only [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect to user_path(@user)
  end

  def destroy
    @user.destroy
    redirect_to root_path
  end

   private

  def find_user
    @user = User.find(params[:user])
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
