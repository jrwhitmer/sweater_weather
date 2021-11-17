class MapquestFacade

  def self.get_lat_long(location)
    data = MapquestService.request_lat_long(location)
    Longlat.new(data[:results].first[:locations].first[:latLng])
  end

  def self.get_route(start_city, end_city)
    data = MapquestService.request_route(start_city, end_city)

    Route.new(data[:route])
  end
end
