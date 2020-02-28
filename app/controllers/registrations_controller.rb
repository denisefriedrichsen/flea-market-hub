class RegistrationsController < Devise::RegistrationsController


  def sign_up_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def after_edit_path_for(resource)
    "/path"
  end
end
