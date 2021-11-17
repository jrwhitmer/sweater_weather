require 'rails_helper'

RSpec.describe 'backgrounds index' do
  it 'renders a json response, correctly formatted' do
    VCR.use_cassette('pexel-search') do
      get "/api/v1/backgrounds?location=denver,co"

      expect(response).to be_successful

      results =JSON.parse(response.body, symbolize_names: true)
      
      expect(results[:data][:attributes]).to have_key(:photographer)
      expect(results[:data][:attributes]).to have_key(:photographer_url)
      expect(results[:data][:attributes]).to have_key(:image_url)

    end
  end
  it 'renders an error when no param is given in query' do
    VCR.use_cassette('bad-search') do
      get "/api/v1/backgrounds"

      expect(response.status).to eq(400)
    end
  end
end
