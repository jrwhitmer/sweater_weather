class Longlat
  attr_reader :latitude,
              :longitude

  def initialize(results)
    @longitude = results[:lng]
    @latitude = results[:lat]
  end

end
