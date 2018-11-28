require 'rails_helper'

describe 'User submits GET request to /api/v1/forecast' do
  it 'with city, state and returns daily forecast data' do
    location = {city: 'LOS ANGELES', state: 'CA'}
    
    get '/api/v1/forecast', params: location

    expect(response).to be_successful

    forecast = JSON.parse(response.body, symbolize_names: true)
    
    expect(forecast).to have_key :daily
    expect(forecast).to have_key :city
    expect(forecast).to have_key :state
    expect(forecast).to have_key :country

    daily = forecast[:daily]

    expect(daily).to have_key :summary
    expect(daily).to have_key :data
    expect(daily[:data]).to be_an Array
    expect(daily[:data].count).to eq 8

    expect(daily[:data].first).to have_key :time
    expect(daily[:data].first).to have_key :summary
    expect(daily[:data].first).to have_key :icon
    expect(daily[:data].first).to have_key :sunrise_time
    expect(daily[:data].first).to have_key :sunset_time
    expect(daily[:data].first).to have_key :moon_phase
    expect(daily[:data].first).to have_key :precip_probability
    expect(daily[:data].first).to have_key :precip_type
    expect(daily[:data].first).to have_key :temperature_high
    expect(daily[:data].first).to have_key :temperature_low
  end
end
