require 'rails_helper'

describe 'User submits GET request to /api/v1/forecast' do
  it 'with city, state and returns forecast data' do
    location = {city: 'LOS ANGELES', state: 'CA'}
    
    get '/api/v1/forecast', params: location
    
    expect(response.status).to be_successful
  end
end