require 'rails_helper'

describe SessionsController do
  before(:each) do
    User.create(email: "test@test.com", password: "testPassword")
  end

  describe 'GET #new' do
    it 'can render the login screen' do
      get :new
      expect(response).to render_template(:new)
    end

    it 'can redirect to user page if logged in' do
      controller.session[:user_id] = User.first.id
      get :new
      expect(response).to redirect_to("http://test.host/users/#{User.first.id}")
    end
  end

  describe 'POST #create' do
    it 'can assign a session user id' do
      post :create, params: { session: { email: "test@test.com", password: "testPassword"}}
      expect(response).to redirect_to("http://test.host/users/#{User.first.id}")
    end

    it 'can render new if the login fails' do
      post :create, params: { session: { email: "test@test.com", password: "wrong"}}
      expect(response).to render_template(:new)
    end
  end
end
