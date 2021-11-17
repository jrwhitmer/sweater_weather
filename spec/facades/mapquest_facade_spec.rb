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
end
