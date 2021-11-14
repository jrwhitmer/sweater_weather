require 'rails_helper'

RSpec.describe ForecastService do
  it 'can make a request to the weather api using data from the mapquest api', :vcr do
    mapquest_info = MapquestFacade.get_lat_long('denver,co')

    response = ForecastService.one_call(mapquest_info.latitude, mapquest_info.longitude)

    expect(response).to be_a(Hash)
  end
end
