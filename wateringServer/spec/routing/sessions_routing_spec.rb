require 'rails_helper'

describe SessionsController do
  it 'routes GET /login to sessions#new' do
    expect(get: '/login').to route_to('sessions#new')
  end

  it 'routes POST /login to sessions#create' do
    expect(post: '/login').to route_to('sessions#create')
  end

  it 'routes DELETE /logout to sessions#destroy' do
    expect(delete: '/logout').to route_to('sessions#destroy')
  end
end
