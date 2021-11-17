require 'rails_helper'

RSpec.describe ForecastFacade do
  it 'creates current_weather objects with appropriate keys' do
    VCR.use_cassette('forecast') do
      mapquest_info = MapquestFacade.get_lat_long('denver,co')

      current_weather = ForecastFacade.current_weather(mapquest_info.latitude, mapquest_info.longitude)

      expect(current_weather).to be_a(CurrentWeather)
      expect(current_weather.datetime).to be_a(DateTime)
      expect(current_weather.sunrise).to be_a(DateTime)
      expect(current_weather.sunset).to be_a(DateTime)
      expect(current_weather.temperature).to be_a(Float)
      expect(current_weather.feels_like).to be_a(Float)
      expect(current_weather.humidity).to be_an(Integer)
      expect(current_weather.uvi).to be_a(Float)
      expect(current_weather.visibility).to be_an(Integer)
      expect(current_weather.conditions).to be_a(String)
      expect(current_weather.icon).to be_a(String)
    end
  end

  it 'creates daily weather objects with appropriate keys' do
    VCR.use_cassette('forecast') do
      mapquest_info = MapquestFacade.get_lat_long('denver,co')

      daily_weathers = ForecastFacade.daily_weather(mapquest_info.latitude, mapquest_info.longitude)

      expect(daily_weathers).to be_an(Array)
      expect(daily_weathers.first).to be_a(DailyWeather)
      expect(daily_weathers.first.date).to be_a(Date)
      expect(daily_weathers.first.sunrise).to be_a(DateTime)
      expect(daily_weathers.first.sunset).to be_a(DateTime)
      expect(daily_weathers.first.max_temp).to be_a(Float)
      expect(daily_weathers.first.min_temp).to be_a(Float)
      expect(daily_weathers.first.conditions).to be_a(String)
      expect(daily_weathers.first.icon).to be_a(String)
    end
  end

  it 'creates hourly weather objects with appropriate keys' do
    VCR.use_cassette('forecast') do
      mapquest_info = MapquestFacade.get_lat_long('denver,co')

      hourly_weathers = ForecastFacade.hourly_weather(mapquest_info.latitude, mapquest_info.longitude)

      expect(hourly_weathers).to be_an(Array)
      expect(hourly_weathers.length).to eq(48)
      expect(hourly_weathers.first).to be_a(HourlyWeather)
      expect(hourly_weathers.first.time).to be_a(Time)
      expect(hourly_weathers.first.temperature).to be_a(Float)
      expect(hourly_weathers.first.conditions).to be_a(String)
      expect(hourly_weathers.first.icon).to be_a(String)
    end
  end
end
