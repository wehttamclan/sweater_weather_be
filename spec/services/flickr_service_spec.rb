require 'rails_helper'

describe FlickrService do
  xit 'takes lat, long and returns a collection of photos' do
    coordinates = "39.7392358,-104.990251"
    
    service = FlickrService.new(coordinates)
    
    expect(service.urls).to be_an Array
  end

end