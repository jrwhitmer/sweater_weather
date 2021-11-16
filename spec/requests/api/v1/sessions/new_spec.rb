require 'rails_helper'

RSpec.describe 'post request to new sessions' do
  it 'returns a 200 response correctly formatted' do

    existing_user = User.create!(email: "whatever@example.com", password: "password", api_key: "cznjkhro3h1494jeiwqd10139")

    json_payload = {
      "email": "whatever@example.com",
      "password": "password"
      }

      post '/api/v1/sessions', params: {user: json_payload}

      expect(response.status).to eq(200)

      parsed = JSON.parse(response.body, symbolize_names: true)

      expect(parsed[:data][:attributes]).to have_key(:email)
      expect(parsed[:data][:attributes]).to have_key(:api_key)
    end
end
