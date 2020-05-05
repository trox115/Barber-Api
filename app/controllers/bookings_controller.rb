class BookingsController <ApplicationController
 before_action :cors_set_access_control_headers 
  include CurrentUserConcern
  def index
    @booking=Booking.all

    render json: @booking
  end
  def create
    @booking =Booking.new(booking_params)

    if @booking.save
      render json: @booking, status: :created, location: @booking
    else
      render json: @booking.errors, status: :unprocessable_entity
    end
  end
  def show 
    @booking=Booking.where(:user_id => @current_user)
    render json: @booking
  end

def cors_set_access_control_headers
  response.headers["Cache-Control"]="max-age=3600"
  response.headers['Access-Control-Allow-Origin'] = 'https://antoniobarberapi.herokuapp.com/booking'
  response.headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, PATCH, DELETE, OPTIONS'
  response.headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token, ' \
    'Auth-Token, Email, X-User-Token, X-User-Email, x-xsrf-token'
  response.headers['Access-Control-Max-Age'] = '1728000'
  response.headers['Access-Control-Allow-Credentials'] = true
end
  private

  def booking_params
    params.require(:booking).permit(:date,:hour,:user_id, :barber_id)
  end
end
