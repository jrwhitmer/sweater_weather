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

    route = Route.new(results[:route])

    expect(route.travel_time).to eq("00:07:39")

    bad_route = {

      "route": {
        "routeError": {
            "errorCode": 2,
            "message": ""
        }
    },
    "info": {
        "statuscode": 402,
        "copyright": {
            "imageAltText": "© 2021 MapQuest, Inc.",
            "imageUrl": "http://api.mqcdn.com/res/mqlogo.gif",
            "text": "© 2021 MapQuest, Inc."
        },
        "messages": [
            "We are unable to route with the given locations."
        ]
    }
  }

  route = Route.new(bad_route[:route])

  expect(route.travel_time).to eq('impossible route')
  expect(route.translated_time_position).to eq(0)
  end

  it '#translated_time_position' do
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

    route = Route.new(results[:route])

    expect(route.translated_time_position).to eq(0)

    results_2 = {
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
        "formattedTime": "02:07:39",
        "sessionId": "61943efd-00b1-5f21-02b4-339f-02d54f828945",
        "hasAccessRestriction": false,
        "realTime": 783,
        "hasSeasonalClosure": false,
        "hasCountryCross": false,
        "fuelUsed": 0.22
      }
    }
    route_2 = Route.new(results_2[:route])

    expect(route_2.translated_time_position).to eq(1)
  end
end
