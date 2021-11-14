class ForecastFacade

  def self.current_weather(latitude, longitude)
    all_data = ForecastService.one_call(latitude, longitude)

    CurrentWeather.new(all_data[:current])
  end

  def self.daily_weather(latitude, longitude)
    all_data = ForecastService.one_call(latitude, longitude)

    daily_weathers = []

    all_data[:daily].each do |daily_data|
      daily_weathers << DailyWeather.new(daily_data)
    end

    daily_weathers
  end

  def self.hourly_weather(latitude, longitude)
    all_data = ForecastService.one_call(latitude, longitude)

    hourly_weathers = []

    all_data[:hourly].each do |hourly_data|
      hourly_weathers << HourlyWeather.new(hourly_data)
    end

    hourly_weathers
  end
end
