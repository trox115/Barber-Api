require 'rails_helper'

RSpec.describe 'BarbersControllers', type: :request do
  let(:user) { create(:random_user) }
  let(:barber) { create(:random_barber) }
  let(:barber2) { create(:random_barber) }

  before(:example) do
    post '/sessions', params: {
      "user": {
        "email": user.email,
        "password": user.password
      }
    }
  end
  after(:each) do
    expect(response).to have_http_status(200)
    expect(response.content_type).to eq('application/json; charset=utf-8')
  end
  it 'shows all barbers' do
    barber.save
    barber2.save
    get '/barbers'
    r = JSON.parse response.body
    expect(r.length).to eq(2)
  end
  it 'if no barbers exist, shows []' do
    get '/barbers'
    r = JSON.parse response.body
    expect(r).to eq([])
  end
end
