require 'rails_helper'

describe PlantsController do
  it 'routes GET /plants/new' do
    expect(get: '/plants/new').to route_to('plants#new')
  end

  it 'routes POST /plants' do
    expect(post: '/plants').to route_to('plants#create')
  end

  it 'routes GET /plants/id' do
    expect(get: "/plants/1").to route_to("plants#show", id: "1")
  end
end
