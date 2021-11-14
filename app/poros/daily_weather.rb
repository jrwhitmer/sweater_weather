require 'date'

class DailyWeather
  attr_reader :date,
              :sunrise,
              :sunset,
              :max_temp,
              :min_temp,
              :conditions,
              :icon

  def initialize(results)
    @date = Time.at(results[:dt]).to_date
    @sunrise = Time.at(results[:sunrise]).to_datetime
    @sunset = Time.at(results[:sunset]).to_datetime
    @max_temp = results[:temp][:max]
    @min_temp = results[:temp][:min]
    @conditions = results[:weather].first[:description]
    @icon = results[:weather].first[:icon]
  end

end
