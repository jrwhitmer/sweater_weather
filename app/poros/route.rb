class Route
  attr_reader :travel_time

  def initialize(results)
    if !results[:formattedTime].nil?
      @travel_time = results[:formattedTime]
    else
      @travel_time = "impossible route"
    end
  end

  def translated_time_position
    if @travel_time != "impossible route"
      position = @travel_time.split(":").first.to_i
      if position != 0
        position - 1
      else
        position
      end 
    else
      0
    end
  end
end
