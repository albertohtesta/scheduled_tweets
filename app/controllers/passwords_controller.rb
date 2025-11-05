class PasswordsController < ApplicationController
  before_action :require_user_logged_in!

  def edit
  end

  def update
    if password_params[:password].blank?
      flash.now[:alert] = "Password can't be blank"
      render :edit
    elsif Current.user.update(password_params)
      redirect_to root_path, notice: "Password updated!"
    else
      render :edit
    end
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
