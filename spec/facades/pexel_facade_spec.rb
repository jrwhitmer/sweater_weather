require 'rails_helper'

RSpec.describe PexelFacade do
  it 'creates image_search options when the pexel api is called' do
    VCR.use_cassette('pexel-search') do
      image_search = PexelFacade.image_search('denver,co')

      expect(image_search).to be_an(ImageSearch)

      expect(image_search.image_url).to be_a(String)
      expect(image_search.photographer).to be_a(String)
      expect(image_search.photographer_url).to be_a(String)
    end
  end
end
