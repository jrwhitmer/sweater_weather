require 'rails_helper'

RSpec.describe CurrentWeather do
  it 'exists' do
    results = {
      :dt=>1636826400,
      :sunrise=>1636810962,
      :sunset=>1636847163,
      :temp=>60.35,
      :feels_like=>57.31,
      :uvi=>0,
      :visibility=>10000,
      :weather=>[{:description=>"sunny", :icon=>'04d'}]
    }

    @current_weather = CurrentWeather.new(results)

    expect(@current_weather).to be_a(CurrentWeather)
  end

  it 'has attributes' do
    results = {
      :dt=>1636826400,
      :sunrise=>1636810962,
      :sunset=>1636847163,
      :temp=>60.35,
      :feels_like=>57.31,
      :uvi=>0,
      :visibility=>10000,
      :weather=>[{:description=>"sunny", :icon=>'04d'}]
    }

    @current_weather = CurrentWeather.new(results)

    expect(@current_weather.datetime).to eq("Sat, 13 Nov 2021 10:00:00 -0800")
    expect(@current_weather.sunrise).to eq("Sat, 13 Nov 2021 05:42:42 -0800")
    expect(@current_weather.sunset).to eq("Sat, 13 Nov 2021 15:46:03 -0800")
    expect(@current_weather.temperature).to eq(60.35)
    expect(@current_weather.feels_like).to eq(57.31)
    expect(@current_weather.uvi).to eq(0)
    expect(@current_weather.visibility).to eq(10000)
    expect(@current_weather.conditions).to eq("sunny")
    expect(@current_weather.icon).to eq("04d")
  end
end
