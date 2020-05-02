class BookingsController <ApplicationController
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
  private

  def booking_params
    params.require(:booking).permit(:date,:hour)
  end
end
