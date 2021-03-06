require 'rails_helper'

RSpec.describe 'post request to users#create' do
  it 'can recieve a json payload and create a user in the database' do
    json_payload = {
      "email": "whatever@example.com",
      "password": "password",
      "password_confirmation": "password"
    }

    post '/api/v1/users', params: {user: json_payload}

    expect(response.status).to eq(201)

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[:data][:attributes]).to have_key(:email)
    expect(parsed[:data][:attributes]).to have_key(:api_key)
  end

  it 'returns an error if the user data does not get saved' do
    json_payload = {
      "email": "whatever@example.com",
    }

    post '/api/v1/users', params: {user: json_payload}

    expect(response.status).to eq(422)
  end
end
