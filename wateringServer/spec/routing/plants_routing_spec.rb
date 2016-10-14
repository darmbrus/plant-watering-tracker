require 'rails_helper'

describe PlantsController do
  it 'does not route GET /plants' do
    expect(get: '/plants').not_to route_to('plants#index')
  end

  it 'routes POST /plants' do
    expect(post: '/plants').to route_to('plants#create')
  end

  it 'routes GET /plants/new' do
    expect(get: '/plants/new').to route_to('plants#new')
  end

  it 'does not route GET /plants/id/edit' do
    expect(get: 'plants/1/edit').not_to route_to('plants#edit', id: '1')
  end

  it 'routes GET /plants/id' do
    expect(get: '/plants/1').to route_to('plants#show', id: '1')
  end

  it 'does not route PATCH /plants/id' do
    expect(patch: '/plants/1').not_to route_to('plants#update', id: '1')
  end

  it 'does not route PUT /plants/id' do
    expect(put: '/plants/1').not_to route_to('plants#update', id: '1')
  end

  it 'does not route DELETE /plants/id' do
    expect(delete: '/plants/1').not_to route_to('plants#destroy', id: '1')
  end
end
