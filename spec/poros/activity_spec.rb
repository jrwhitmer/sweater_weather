require 'rails_helper'

RSpec.describe Activity do
  it 'exists' do
    results = {
      :activity=>"Give your pet ten minutes of focused attention",
     :type=>"relaxation",
     :participants=>1,
     :price=>0,
     :link=>"",
     :key=>"9937387",
     :accessibility=>0
    }

    activity = Activity.new(results)
    expect(activity).to be_an(Activity)
  end
  it 'has attributes' do
    results = {
      :activity=>"Give your pet ten minutes of focused attention",
     :type=>"relaxation",
     :participants=>1,
     :price=>0,
     :link=>"",
     :key=>"9937387",
     :accessibility=>0
    }

    activity = Activity.new(results)

    expect(activity.name).to eq("Give your pet ten minutes of focused attention")
    expect(activity.type).to eq("relaxation")
    expect(activity.participants).to eq(1)
    expect(activity.price).to eq(0)
  end
end
