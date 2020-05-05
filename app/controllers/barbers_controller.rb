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
def cors_set_access_control_headers
  response.headers["Cache-Control"]="max-age=360"
  response.headers['Access-Control-Allow-Origin'] = 'https://antoniobarberapi.herokuapp.com/home'
  response.headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, PATCH, DELETE, OPTIONS'
  response.headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token, ' \
    'Auth-Token, Email, X-User-Token, X-User-Email, x-xsrf-token'
  response.headers['Access-Control-Max-Age'] = '1728000'
  response.headers['Access-Control-Allow-Credentials'] = true
end
end

