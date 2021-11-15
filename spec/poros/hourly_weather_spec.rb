require 'rails_helper'

RSpec.describe HourlyWeather do
  it 'exists' do
    results = {
      :dt=>1636826400,
      :temp=>45.75,
      :weather=>[{:description=>"cloudy", :icon=>"4u7"}]
    }

    @hourly_weather = HourlyWeather.new(results)
    expect(@hourly_weather).to be_a(HourlyWeather)
  end

  it 'has attributes' do
    results = {
      :dt=>1636826400,
      :temp=>45.75,
      :weather=>[{:description=>"cloudy", :icon=>"4u7"}]
    }

    @hourly_weather = HourlyWeather.new(results)

    expect(@hourly_weather.time).to eq("2021-11-13 10:00:00 -0800")
    expect(@hourly_weather.temperature).to eq(45.75)
    expect(@hourly_weather.conditions).to eq("cloudy")
    expect(@hourly_weather.icon).to eq("4u7")
  end
end
