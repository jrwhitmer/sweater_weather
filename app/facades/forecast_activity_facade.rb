class ForecastActivityFacade

  def self.new_report(destination)
    @lat_long = MapquestFacade.get_lat_long(destination)
    @current_weather = ForecastFacade.current_weather(@lat_long.latitude, @lat_long.longitude)
    @activity_1 = ActivitiesFacade.get_one_activity('relaxation')
    if @current_weather.temperature < 50
      @activity_2 = ActivitiesFacade.get_one_activity('cooking')
    elsif @current_weather.temperature >= 50 && @current_weather.temperature < 60
      @activity_2 = ActivitiesFacade.get_one_activity('busywork')
    elsif @current_weather.temperature >= 60
      @activity_2 = ActivitiesFacade.get_one_activity('recreational')
    end

    report = {
      data: {
        id: nil,
        type: "activities",
        attributes: {
          destination: destination,
          forecast: {
            summary: @current_weather.conditions,
            temperature: "#{@current_weather.temperature} F"
          },
          activities: [
              {title: @activity_1.name,
              type: @activity_1.type,
              participants: @activity_1.participants,
              price: @activity_1.price},
              {title: @activity_2.name,
              type: @activity_2.type,
              participants: @activity_2.participants,
              price: @activity_2.price
            }]
          }
        }
      }
  end
end
