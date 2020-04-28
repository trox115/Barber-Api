class RegistrationsController <ApplicationController
  include CurrentUserConcern
  def create
    user= User.create!(
      email: params["user"]["email"],
      password: params["user"]["password"],
      password_confirmation: params["user"]["password_confirmation"],
    )

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
end