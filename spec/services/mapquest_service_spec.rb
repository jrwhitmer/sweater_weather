require 'rails_helper'

RSpec.describe MapquestService do
  it 'can call the mapquest API' do
    VCR.use_cassette('mapquest') do
      response = MapquestService.request_lat_long('denver,co')

      expect(response).to be_a(Hash)
    end
  end
  it 'can call the mapquest directions API' do
    VCR.use_cassette('mapquest-directions') do
      response = MapquestService.request_route('denver,co', 'sausalito,ca')

      expect(response).to be_a(Hash)
    end
  end
end
