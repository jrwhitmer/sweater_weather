require 'rails_helper'

RSpec.describe ActivitiesFacade do
  it 'creates an activity object based on a type query to bored api' do
    VCR.use_cassette('bored-service') do
      activity = ActivitiesFacade.get_one_activity('relaxation')

      expect(activity).to be_an(Activity)
      expect(activity.name).to be_a(String)
      expect(activity.type).to be_a(String)
      expect(activity.participants).to be_an(Integer)
      expect(activity.price).to be_an(Integer)
    end
  end
end
