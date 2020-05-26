require 'rails_helper'

RSpec.describe 'Status of the API' do
  describe 'Get /' do
    it 'returns a status message' do
      get '/'
      json = JSON.parse(response.body)
      expect(json['status']).to eql('working')
    end
    it 'returns the http code 200' do
      get('/')
      expect(response.status).to eql(200)
    end
  end
end
