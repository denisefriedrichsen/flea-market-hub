class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = policy_scope(User).order(created_at: :desc)
  end

  def show
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
    @user = current_user
    authorize @user
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
