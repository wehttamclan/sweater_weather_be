require 'rails_helper'

describe GoogleGeocoderService do
  it 'takes city, state and returns lat, long' do
    search_params = {city: "denver", state: "co"}
    
    service = GoogleGeocoderService.new(search_params)
    
    expect(service.coordinates).to eq("39.7392358,-104.990251")
  end
  it 'takes zip code and returns lat, long' do
    search_params = {zip_code: 80013}
    
    service = GoogleGeocoderService.new(search_params)
    
    expect(service.coordinates).to eq("39.6563415,-104.7637619")
  end
end