class ForecastService

  def self.one_call(latitude, longitude)
    response = Faraday.get("https://api.openweathermap.org/data/2.5/onecall?lat=#{latitude}&lon=#{longitude}&units=imperial&appid=#{ENV["WEATHER_API_KEY"]}")

    JSON.parse(response.body, symbolize_names: true)
  end

end
