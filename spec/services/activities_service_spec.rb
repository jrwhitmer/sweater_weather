require 'rails_helper'

RSpec.describe ActivitiesService do
  it 'returns data with an activity based on type' do
    VCR.use_cassette('bored-service') do
      response = ActivitiesService.get_one_activity('relaxation')

      expect(response).to be_a(Hash)
    end
  end
end
