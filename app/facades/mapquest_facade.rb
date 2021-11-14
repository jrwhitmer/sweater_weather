class MapquestFacade

  def self.get_lat_long(location)
    data = MapquestService.request_lat_long(location)
    Longlat.new(data[:results].first[:locations].first[:latLng])
  end

end
