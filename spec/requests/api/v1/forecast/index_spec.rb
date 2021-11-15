require 'rails_helper'

RSpec.describe 'Forecast find via location query' do
  it 'returns a forecast by location' do
    VCR.use_cassette('all-call-weather') do
      get "/api/v1/forecast?location=denver,co"

      expect(response).to be_successful

      forecast = JSON.parse(response.body, symbolize_names: true)

      expect(forecast).to be_a(Hash)

      expect(forecast).to have_key(:id)
      expect(forecast).to have_key(:type)
      expect(forecast).to have_key(:attributes)
    end
  end
  it 'returns an error if parameters are not given' do
    VCR.use_cassette('invalid-call') do
      get "/api/v1/forecast"

      expect(response.status).to eq 400
    end
  end
end
