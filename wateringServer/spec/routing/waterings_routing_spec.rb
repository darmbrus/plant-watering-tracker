require 'rails_helper'

describe WateringsController do
  it 'routes GET /plants/1/waterings/new' do
    expect(get: '/plants/1/waterings/new').to route_to('waterings#new', plant_id: "1")
  end

  it 'routes POST /plants/1/waterings/' do
    expect(post: '/plants/1/waterings').to route_to('waterings#create', plant_id: "1")
  end

  it 'does not route GET /plants/1/waterings/1' do
    expect(get: '/plants/1/waterings/1').not_to route_to('waterings#show', plant_id: "1", id: "1")
  end
end
