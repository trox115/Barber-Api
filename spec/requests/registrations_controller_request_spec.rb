require 'rails_helper'

RSpec.describe 'RegistrationsControllers', type: :request do
  let(:user) { build(:random_user) }

  it 'Test if user can register' do
    post '/registrations', params: {
      "user": {
        "email": user.email,
        "password": user.password,
        "password_confirmation": user.password
      }
    }
    expect(response).to have_http_status(200)
    r = JSON.parse response.body
    expect(r['status']).to eq('created')
  end
  it 'Test if user can not register if already registered' do
    user2 = user
    post '/registrations', params: {
      "user": {
        "email": user.email,
        "password": user.password,
        "password_confirmation": user.password
      }
    }
    expect(user2).not_to be_valid
  end
end
