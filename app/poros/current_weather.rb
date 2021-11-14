require 'date'

class CurrentWeather
  attr_reader :datetime,
              :sunrise,
              :sunset,
              :temperature,
              :feels_like,
              :humidity,
              :uvi,
              :visibility,
              :conditions,
              :icon

  def initialize(results)
    @datetime = Time.at(results[:dt]).to_datetime
    @sunrise = Time.at(results[:sunrise]).to_datetime
    @sunset = Time.at(results[:sunset]).to_datetime
    @temperature = results[:temp]
    @feels_like = results[:feels_like]
    @humidity = results[:humidity]
    @uvi = results[:uvi]
    @visibility = results[:visibility]
    @conditions = results[:weather].first[:description]
    @icon = results[:weather].first[:icon]
  end

end
