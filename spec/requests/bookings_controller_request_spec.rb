require 'rails_helper'

RSpec.describe 'BookingsControllers', type: :request do
  let(:user) { create(:random_user) }
  let(:user2) { create(:random_user) }
  let(:barber) { create(:random_barber) }
  let(:barber2) { create(:random_barber) }
  before(:each) do
    post '/sessions', params: {
      "user": {
        "email": user.email,
        "password": user.password
      }
    }
  end
  after(:each) do
    expect(response.content_type).to eq('application/json; charset=utf-8')
  end
  it 'creates a booking with user, barber and random date' do
    barber.save
    user.save
    post '/bookings', params: {
      "booking": {
        "user_id": user.id,
        "barber_id": barber.id,
        "book_time": Faker::Date.in_date_period
      }
    }
    expect(response).to have_http_status(201)
  end

  it 'Shows the bookings that belongs to user' do
    post '/bookings', params: {
      "booking": {
        "user_id": user.id,
        "barber_id": barber.id,
        "book_time": Faker::Date.in_date_period
      }
    }
    post '/bookings', params: {
      "booking": {
        "user_id": user.id,
        "barber_id": barber.id,
        "book_time": Faker::Date.in_date_period
      }
    }
    @request[@current_user] = user
    get '/bookings'
    expect(response).to have_http_status(200)
    json = JSON.parse response.body
    expect(json.length).to eq(2)
  end
end
