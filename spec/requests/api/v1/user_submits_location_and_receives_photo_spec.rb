require 'rails_helper'

describe 'User submits GET request to /api/v1/backgrounds' do
  it 'with city, state and returns a random background photo url' do
    location = {city: 'denver', state: 'co'}
    
    get '/api/v1/backgrounds', params: location

    expect(response).to be_successful

    background = JSON.parse(response.body, symbolize_names: true)
    
    expect(background).to have_key :city
    expect(background).to have_key :state
    expect(background).to have_key :url


  end
end
