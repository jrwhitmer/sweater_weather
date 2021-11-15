 require 'rails_helper'

 RSpec.describe PexelService do
   it 'can make a call to the pexel api' do
     VCR.use_cassette('pexel-service') do
       response = PexelService.image_search('denver,co')

       expect(response).to be_a(Hash) 
     end
   end
 end
