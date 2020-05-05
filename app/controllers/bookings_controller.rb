class BookingsController <ApplicationController
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
  private

  def booking_params
    params.require(:booking).permit(:date,:hour,:user_id, :barber_id)
  end
end