require 'rails_helper'

RSpec.describe Longlat do
  it 'exists' do
    results = {lng: 45.32124, lat: 56.86542}
    expected = Longlat.new(results)

    expect(expected).to be_a(Longlat)
  end

  it 'has attributes' do
    results = {lng: 45.32124, lat: 56.86542}
    expected = Longlat.new(results)

    expect(expected.longitude).to eq(45.32124)
    expect(expected.latitude).to eq(56.86542)
  end
end
