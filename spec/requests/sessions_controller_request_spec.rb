require 'rails_helper'
RSpec.describe "SessionsControllers", type: :request do
let(:user) {create(:random_user)}

	 
	 before(:each) do
 
      post '/sessions', params: {
        "user": {
          "email": user.email,
          "password": user.password,
        }
      }
  	end
  	after(:each) do
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end
     it 'Test if user can login' do
     	post '/sessions', params: {
        "user": {
          "email": user.email,
          "password": user.password,
        }
      }
       expect(response).to have_http_status(200)
       r = JSON.parse response.body
    	expect(r['logged_in']).to eq(true)
    end
	it 'Test if user is logged in' do
     	get '/loggedin'
       expect(response).to have_http_status(200)
    end
    it ' Test if user logs out' do
    	delete '/logout'
    	r = JSON.parse response.body
    	expect(r['logged_out']).to eq(true)
    	 expect(response).to have_http_status(200)
    end

	end
