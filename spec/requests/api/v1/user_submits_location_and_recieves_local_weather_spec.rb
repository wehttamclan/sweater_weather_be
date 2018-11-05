require 'rails_helper'

describe 'User submits GET request to /api/v1/forecast' do
  it 'with city, state and returns daily forecast data' do
    location = {city: 'LOS ANGELES', state: 'CA'}
    
    get '/api/v1/forecast', params: location
    
    expect(response.status).to be_successful
    expect(response.body).to have_key :daily
    expect(response.body).to have_key :city
    expect(response.body).to have_key :state
    expect(response.body).to have_key :country

    daily = response.body[:daily]

    expect(daily).to have_key :summary
    expect(daily).to have_key :data
    expect(daily[:data]).to be_an Array
    expect(daily[:data].count).to eq 8

    expect(daily[:data].first).to have_key :time
    expect(daily[:data].first).to have_key :summary
    expect(daily[:data].first).to have_key :icon
    expect(daily[:data].first).to have_key :sunriseTime
    expect(daily[:data].first).to have_key :sunsetTime
    expect(daily[:data].first).to have_key :moonPhase
    expect(daily[:data].first).to have_key :precipProbability
    expect(daily[:data].first).to have_key :precipType
    expect(daily[:data].first).to have_key :temperatureHigh
    expect(daily[:data].first).to have_key :temperatureLow
  end
end
