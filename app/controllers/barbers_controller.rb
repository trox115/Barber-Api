class BarbersController < ApplicationController

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

