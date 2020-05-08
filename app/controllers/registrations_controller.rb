class RegistrationsController < ApplicationController
  def create
    user = User.create!(register_params)

    if user
      session[:user_id] = user.id
      render json: {
        status: :created
      }
    else
      render json: {
        status: 500
      }
    end
  end

  private

  def register_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
