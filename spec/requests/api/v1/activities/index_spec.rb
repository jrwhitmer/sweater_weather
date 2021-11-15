require 'rails_helper'

RSpec.describe 'Activities Index' do
  it 'will return a properly formatted response based on the destination query' do
    VCR.use_cassette('activity-index') do
      get "/api/v1/activities?destination=denver,co"

      expect(response).to be_successful

      activity_forecast = JSON.parse(response.body, symbolize_names: true)

      expect(activity_forecast).to be_a(Hash)

      expect(activity_forecast).to have_key(:data)

      expect(activity_forecast[:data]).to have_key(:id)
      expect(activity_forecast[:data]).to have_key(:type)
      expect(activity_forecast[:data]).to have_key(:attributes)

      expect(activity_forecast[:data][:attributes]).to have_key(:destination)
      expect(activity_forecast[:data][:attributes]).to have_key(:forecast)
      expect(activity_forecast[:data][:attributes]).to have_key(:activities)

      expect(activity_forecast[:data][:attributes][:forecast]).to have_key(:summary)
      expect(activity_forecast[:data][:attributes][:forecast]).to have_key(:temperature)

      expect(activity_forecast[:data][:attributes][:activities]).to be_an(Array)
      expect(activity_forecast[:data][:attributes][:activities].length).to eq(2)

      expect(activity_forecast[:data][:attributes][:activities][0]).to have_key(:title)
      expect(activity_forecast[:data][:attributes][:activities][0]).to have_key(:type)
      expect(activity_forecast[:data][:attributes][:activities][0]).to have_key(:participants)
      expect(activity_forecast[:data][:attributes][:activities][0]).to have_key(:price)
    end
  end
  it 'returns one relaxation and one recreational if temperature is greater than 60 F' do
    VCR.use_cassette('hot-weather-activities') do
      get "/api/v1/activities?destination=orlando,fl"

      expect(response).to be_successful

      activity_forecast = JSON.parse(response.body, symbolize_names: true)

      expect(activity_forecast[:data][:attributes][:activities][0][:type]).to eq("relaxation")
      expect(activity_forecast[:data][:attributes][:activities][1][:type]).to eq("recreational")
    end
  end
  it 'returns one relaxation and one busywork activity if temperature is greater or equal to 50 but less than 60 F' do
    VCR.use_cassette('mid-weather-activities') do
      get "/api/v1/activities?destination=napa,ca"

      expect(response).to be_successful

      activity_forecast = JSON.parse(response.body, symbolize_names: true)

      expect(activity_forecast[:data][:attributes][:activities][0][:type]).to eq("relaxation")
      expect(activity_forecast[:data][:attributes][:activities][1][:type]).to eq("busywork")
    end
  end
  it 'returns one relaxation and one cooking activity if temperature is less than 50 F' do
    VCR.use_cassette('cold-weather-activities') do
      get "/api/v1/activities?destination=rochester,ny"

      expect(response).to be_successful

      activity_forecast = JSON.parse(response.body, symbolize_names: true)

      expect(activity_forecast[:data][:attributes][:activities][0][:type]).to eq("relaxation")
      expect(activity_forecast[:data][:attributes][:activities][1][:type]).to eq("cooking")
    end
  end
end
