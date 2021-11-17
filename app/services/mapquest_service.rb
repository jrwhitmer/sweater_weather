class MapquestService

  def self.request_lat_long(location)
    response = Faraday.get("http://www.mapquestapi.com/geocoding/v1/address?key=#{ENV["MAPQUEST_API_KEY"]}&location=#{location}")

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.request_route(start_city, end_city)
    response = Faraday.get("http://www.mapquestapi.com/directions/v2/route?key=#{ENV["MAPQUEST_API_KEY"]}&from=#{start_city}&to=#{end_city}")

    JSON.parse(response.body, symbolize_names: true)
  end

end
