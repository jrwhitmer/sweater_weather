require 'rails_helper'

RSpec.describe 'road trip creation' do
  it 'it can receive json and post to roadtrips' do
    VCR.use_cassette('roadtrip-call') do
      existing_user = User.create!(email: "whatever@example.com", password: "password", api_key: "cznjkhro3h1494jeiwqd10139")

      json_payload = {
        "origin": "Denver,CO",
        "destination": "Pueblo,CO",
        "api_key": "cznjkhro3h1494jeiwqd10139"
      }

      post '/api/v1/road_trip', params: {road_trip: json_payload}

      expect(response.status).to eq(200)

      parsed = JSON.parse(response.body, symbolize_names: true)

      expect(parsed[:data][:attributes]).to have_key(:start_city)
      expect(parsed[:data][:attributes]).to have_key(:end_city)
      expect(parsed[:data][:attributes]).to have_key(:travel_time)
      expect(parsed[:data][:attributes]).to have_key(:weather_at_eta)

      expect(parsed[:data][:attributes][:weather_at_eta]).to have_key(:temperature)
      expect(parsed[:data][:attributes][:weather_at_eta]).to have_key(:conditions)
    end
  end

end
