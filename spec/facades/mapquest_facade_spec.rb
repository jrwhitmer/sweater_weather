require 'rails_helper'

RSpec.describe MapquestFacade do
  it 'returns the right data from the mapquest api call', :vcr do
    lat_long = MapquestFacade.get_lat_long("denver,co")

    expect(lat_long).to be_a(Longlat)
    expect(lat_long.latitude).to be_an(Float)
    expect(lat_long.longitude).to be_an(Float)
  end
end
