require 'rails_helper'

RSpec.describe AllWeatherFacade do
  it 'returns a correctly formatted response with all the data from the weather one call' do
    VCR.use_cassette('all-call-weather') do
      response = AllWeatherFacade.new_report('denver,co')

      expect(response[:id]).to eq(nil)
      expect(response[:type]).to eq('forecast')
      expect(response).to have_key(:attributes)

      expect(response[:attributes]).to have_key(:current_weather)
      expect(response[:attributes]).to have_key(:daily_weather)
      expect(response[:attributes]).to have_key(:hourly_weather)

      expect(response[:attributes][:current_weather]).to have_key(:datetime)
      expect(response[:attributes][:current_weather]).to have_key(:sunrise)
      expect(response[:attributes][:current_weather]).to have_key(:sunset)
      expect(response[:attributes][:current_weather]).to have_key(:temperature)
      expect(response[:attributes][:current_weather]).to have_key(:feels_like)
      expect(response[:attributes][:current_weather]).to have_key(:humidity)
      expect(response[:attributes][:current_weather]).to have_key(:uvi)
      expect(response[:attributes][:current_weather]).to have_key(:visibility)
      expect(response[:attributes][:current_weather]).to have_key(:conditions)
      expect(response[:attributes][:current_weather]).to have_key(:icon)

      expect(response[:attributes][:daily_weather][0]).to have_key(:date)
      expect(response[:attributes][:daily_weather][0]).to have_key(:sunrise)
      expect(response[:attributes][:daily_weather][0]).to have_key(:sunset)
      expect(response[:attributes][:daily_weather][0]).to have_key(:max_temp)
      expect(response[:attributes][:daily_weather][0]).to have_key(:min_temp)
      expect(response[:attributes][:daily_weather][0]).to have_key(:conditions)
      expect(response[:attributes][:daily_weather][0]).to have_key(:icon)
      expect(response[:attributes][:daily_weather].length).to eq(5)

      expect(response[:attributes][:hourly_weather][0]).to have_key(:time)
      expect(response[:attributes][:hourly_weather][0]).to have_key(:temperature)
      expect(response[:attributes][:hourly_weather][0]).to have_key(:conditions)
      expect(response[:attributes][:hourly_weather][0]).to have_key(:icon)
      expect(response[:attributes][:hourly_weather].length).to eq(8)
    end
  end
end
