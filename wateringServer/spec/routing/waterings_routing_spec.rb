require 'rails_helper'

describe WateringsController do
  it 'does not route GET /waterings' do
    expect(get: '/plants/1/waterings').not_to route_to('waterings#index', plant_id: '1')
  end

  it 'routes POST /plants/1/waterings/' do
    expect(post: '/plants/1/waterings').to route_to('waterings#create', plant_id: '1')
  end

  it 'routes GET /plants/1/waterings/new' do
    expect(get: '/plants/1/waterings/new').to route_to('waterings#new', plant_id: '1')
  end

  it 'does not route GET /plants/id/watering/id/edit' do
    expect(get: '/plants/1/waterings/1/edit').not_to route_to('waterings#edit', plant_id: '1', id: '1')
  end

  it 'does not route GET /plants/id/waterings/id' do
    expect(get: '/plants/1/waterings/1').not_to route_to('waterings#show', plant_id: '1', id: '1')
  end

  it 'does not route PATCH /plants/id/waterings/id' do
    expect(patch: 'plants/1/waterings/1').not_to route_to('waterings#update', plant_id: '1', id: '1')
  end

  it 'does not route PUT /plants/id/waterings/id' do
    expect(put: '/plants/1/waterings/1').not_to route_to('waterings#update', plant_id: '1', id: '1')
  end

  it 'does not route DELETE /plants/id/waterings/id' do
    expect(delete: '/plants/1/waterings/1').not_to route_to('waterings#destroy', plant_id: '1', id: '1')
  end
end
