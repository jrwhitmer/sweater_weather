require 'rails_helper'

RSpec.describe MapquestService do
  it 'can call the mapquest API', :vcr do
    response = MapquestService.request_lat_long('denver,co')

    expect(response).to be_a(Hash)
  end
end
