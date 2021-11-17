class ReportFacade

  def self.new_weather_report(location)
    @longlat = MapquestFacade.get_lat_long(location)
    @current_weather = ForecastFacade.current_weather(@longlat.latitude, @longlat.longitude)
    @daily_weather_5 = ForecastFacade.daily_weather(@longlat.latitude, @longlat.longitude).first(5)
    @hourly_weather_8 = ForecastFacade.hourly_weather(@longlat.latitude, @longlat.longitude).first(8)

    results = {
      id: nil,
      type: "forecast",
      attributes: {
        current_weather: {
          datetime: @current_weather.datetime,
          sunrise: @current_weather.sunrise,
          sunset: @current_weather.sunset,
          temperature: @current_weather.temperature,
          feels_like: @current_weather.feels_like,
          humidity: @current_weather.humidity,
          uvi: @current_weather.uvi,
          visibility: @current_weather.visibility,
          conditions: @current_weather.conditions,
          icon: @current_weather.icon
        },
        daily_weather: [{
          date: @daily_weather_5.first.date,
          sunrise: @daily_weather_5.first.sunrise,
          sunset: @daily_weather_5.first.sunset,
          max_temp: @daily_weather_5.first.max_temp,
          min_temp: @daily_weather_5.first.min_temp,
          conditions: @daily_weather_5.first.conditions,
          icon: @daily_weather_5.first.icon
        },
        {
          date: @daily_weather_5.second.date,
          sunrise: @daily_weather_5.second.sunrise,
          sunset: @daily_weather_5.second.sunset,
          max_temp: @daily_weather_5.second.max_temp,
          min_temp: @daily_weather_5.second.min_temp,
          conditions: @daily_weather_5.second.conditions,
          icon: @daily_weather_5.second.icon
        },
        {
          date: @daily_weather_5.third.date,
          sunrise: @daily_weather_5.third.sunrise,
          sunset: @daily_weather_5.third.sunset,
          max_temp: @daily_weather_5.third.max_temp,
          min_temp: @daily_weather_5.third.min_temp,
          conditions: @daily_weather_5.third.conditions,
          icon: @daily_weather_5.third.icon
        },
        {
          date: @daily_weather_5[3].date,
          sunrise: @daily_weather_5[3].sunrise,
          sunset: @daily_weather_5[3].sunset,
          max_temp: @daily_weather_5[3].max_temp,
          min_temp: @daily_weather_5[3].min_temp,
          conditions: @daily_weather_5[3].conditions,
          icon: @daily_weather_5[3].icon
        },
        {
          date: @daily_weather_5[4].date,
          sunrise: @daily_weather_5[4].sunrise,
          sunset: @daily_weather_5[4].sunset,
          max_temp: @daily_weather_5[4].max_temp,
          min_temp: @daily_weather_5[4].min_temp,
          conditions: @daily_weather_5[4].conditions,
          icon: @daily_weather_5[4].icon
        }],
        hourly_weather: [
          {
            time: @hourly_weather_8.first.time,
            temperature: @hourly_weather_8.first.temperature,
            conditions: @hourly_weather_8.first.conditions,
            icon: @hourly_weather_8.first.icon
          },
          {
            time: @hourly_weather_8.second.time,
            temperature: @hourly_weather_8.second.temperature,
            conditions: @hourly_weather_8.second.conditions,
            icon: @hourly_weather_8.second.icon
          },
          {
            time: @hourly_weather_8.third.time,
            temperature: @hourly_weather_8.third.temperature,
            conditions: @hourly_weather_8.third.conditions,
            icon: @hourly_weather_8.third.icon
          },
          {
            time: @hourly_weather_8[3].time,
            temperature: @hourly_weather_8[3].temperature,
            conditions: @hourly_weather_8[3].conditions,
            icon: @hourly_weather_8[3].icon
          },
          {
            time: @hourly_weather_8[4].time,
            temperature: @hourly_weather_8[4].temperature,
            conditions: @hourly_weather_8[4].conditions,
            icon: @hourly_weather_8[4].icon
          },
          {
            time: @hourly_weather_8[5].time,
            temperature: @hourly_weather_8[5].temperature,
            conditions: @hourly_weather_8[5].conditions,
            icon: @hourly_weather_8[5].icon
          },
          {
            time: @hourly_weather_8[6].time,
            temperature: @hourly_weather_8[6].temperature,
            conditions: @hourly_weather_8[6].conditions,
            icon: @hourly_weather_8[6].icon
          },
          {
            time: @hourly_weather_8[7].time,
            temperature: @hourly_weather_8[7].temperature,
            conditions: @hourly_weather_8[7].conditions,
            icon: @hourly_weather_8[7].icon
          }
        ]
      }
    }
  end

  def self.new_background_report(location)
    @image_search = PexelFacade.image_search(location)
    report = {
      data: {
        type: "image",
        id: nil,
        attributes: {
          image: {
            location: location,
            image_url: @image_search.image_url,
            credit: {
              source: "pexel.com",
              author: @image_search.photographer,
              author_url: @image_search.photographer_url
            }
          }
        }
      }
    }
  end

  def self.new_route_report(origin, destination)
    @route = MapquestFacade.get_route(origin, destination)
    @eta_weather = ForecastFacade.hourly_weather(destination)[@route.translated_time_position]

    report = {
      "data": {
        "id": null,
        "type": "roadtrip",
        "attributes": {
          "start_city": origin,
          "end_city": destination,
          "travel_time": @route.travel_time
          "weather_at_eta": {
            "temperature": @eta_weather.temperature,
            "conditions": @eta_weather.conditions
          }
        }
      }
    }
  end
end
