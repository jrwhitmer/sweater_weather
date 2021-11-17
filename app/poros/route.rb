class Route
  attr_reader :travel_time

  def initialize(results)
    @travel_time = results[:formattedTime]
  end
end
