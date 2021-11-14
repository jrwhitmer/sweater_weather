require 'rails_helper'

RSpec.describe DailyWeather do
  it 'exists' do
    results = {
      :dt=>1636826400,
      :sunrise=>1636810962,
      :sunset=>1636847163,
      :temp=>{:max=>45.67, :min=>11.46},
      :weather=>[{:description=>"cloudy", :icon=>"4u7"}]
    }

    @daily_weather = DailyWeather.new(results)
    expect(@daily_weather).to be_a(DailyWeather)
  end
  it 'has attributes' do
    results = {
      :dt=>1636826400,
      :sunrise=>1636810962,
      :sunset=>1636847163,
      :temp=>{:max=>45.67, :min=>11.46},
      :weather=>[{:description=>"cloudy", :icon=>"4u7"}]
    }

    @daily_weather = DailyWeather.new(results)

    expect(@daily_weather.date.to_s).to eq("2021-11-13")
    expect(@daily_weather.sunrise).to eq("Sat, 13 Nov 2021 05:42:42 -0800")
    expect(@daily_weather.sunset).to eq("Sat, 13 Nov 2021 15:46:03 -0800")
    expect(@daily_weather.max_temp).to eq(45.67)
    expect(@daily_weather.min_temp).to eq(11.46)
    expect(@daily_weather.conditions).to eq("cloudy")
    expect(@daily_weather.icon).to eq("4u7")
  end
end
