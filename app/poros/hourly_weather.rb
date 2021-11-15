require 'date'
require 'time'

class HourlyWeather
  attr_reader :time,
              :temperature,
              :conditions,
              :icon

  def initialize(results)
    @time = Time.at(results[:dt]).to_time
    @temperature = results[:temp]
    @conditions = results[:weather].first[:description]
    @icon = results[:weather].first[:icon]
  end

end
