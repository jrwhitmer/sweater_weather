require 'rails_helper'

RSpec.describe Route do
  it 'exists' do
    results = {
      "route": {
        "hasTollRoad": false,
        "hasBridge": true,
        "boundingBox": {
            "lr": {
                "lng": -77.071159,
                "lat": 38.848869
            },
            "ul": {
                "lng": -77.090401,
                "lat": 38.889584
            }
        },
        "distance": 4.332,
        "hasTimedRestriction": false,
        "hasTunnel": false,
        "hasHighway": true,
        "computedWaypoints": [],
        "routeError": {
            "errorCode": -400,
            "message": ""
        },
        "formattedTime": "00:07:39",
        "sessionId": "61943efd-00b1-5f21-02b4-339f-02d54f828945",
        "hasAccessRestriction": false,
        "realTime": 783,
        "hasSeasonalClosure": false,
        "hasCountryCross": false,
        "fuelUsed": 0.22
      }
    }

    route = Route.new(results)

    expect(route).to be_a(Route)
  end

  it 'has attributes' do
    results = {
      "route": {
        "hasTollRoad": false,
        "hasBridge": true,
        "boundingBox": {
            "lr": {
                "lng": -77.071159,
                "lat": 38.848869
            },
            "ul": {
                "lng": -77.090401,
                "lat": 38.889584
            }
        },
        "distance": 4.332,
        "hasTimedRestriction": false,
        "hasTunnel": false,
        "hasHighway": true,
        "computedWaypoints": [],
        "routeError": {
            "errorCode": -400,
            "message": ""
        },
        "formattedTime": "00:07:39",
        "sessionId": "61943efd-00b1-5f21-02b4-339f-02d54f828945",
        "hasAccessRestriction": false,
        "realTime": 783,
        "hasSeasonalClosure": false,
        "hasCountryCross": false,
        "fuelUsed": 0.22
      }
    }

    route = Route.new(results)

    expect(route.travel_time).to eq("00:07:39")
  end
end