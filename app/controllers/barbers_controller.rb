class BarbersController < ApplicationController
    before_action :cors_set_access_control_headers
  # GET /barbers
  def index
    @barber=Barber.all

    render json: @barber
  end

  # GET /barbers/1
  def show
    render json: @barber
  end
end

