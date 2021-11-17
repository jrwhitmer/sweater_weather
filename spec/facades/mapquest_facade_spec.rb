require 'rails_helper'

RSpec.describe MapquestFacade do
  it 'returns the right data from the mapquest api call' do
    VCR.use_cassette('mapquest-facade') do
      lat_long = MapquestFacade.get_lat_long("denver,co")

      expect(lat_long).to be_a(Longlat)
      expect(lat_long.latitude).to be_an(Float)
      expect(lat_long.longitude).to be_an(Float)
    end
  end
  it 'returns the correct data from the directions api and creates a route object' do
    VCR.use_cassette('directions-facade') do
      route = MapquestFacade.get_route('denver,co', 'sausalito,ca')

      expect(route).to be_a(Route)
      expect(route.travel_time).to be_a(String)
    end
  end
  it 'does not return unnecessary data in the poro' do
    VCR.use_cassette('mapquest-no-data') do
      lat_long = MapquestFacade.get_lat_long("denver,co")
      route = MapquestFacade.get_route('denver,co', 'sausalito,ca')

      expect(lat_long).not_to respond_to(:map_url)
      expect(lat_long).not_to respond_to(:postal_code)
      expect(lat_long).not_to respond_to(:options)
      expect(lat_long).not_to respond_to(:streets)
      expect(lat_long).not_to respond_to(:copyright)

      expect(route).not_to respond_to(:has_highway)
      expect(route).not_to respond_to(:has_tunnel)
      expect(route).not_to respond_to(:route_error)
      expect(route).not_to respond_to(:fuel_used)
      expect(route).not_to respond_to(:legs)
    end 
  end
end
