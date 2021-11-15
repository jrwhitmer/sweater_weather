require 'rails_helper'

RSpec.describe ForecastActivityFacade do
  it 'generates a report from the weather and activities services' do
    VCR.use_cassette('activity-report') do
      report = ForecastActivityFacade.new_report("denver,co")

      expect(report).to be_a(Hash)
    end
  end
end
