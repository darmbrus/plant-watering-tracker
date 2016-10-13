require 'rails_helper'

describe SessionsController do
  describe 'GET #new' do
    it 'can render the login screen' do
      get :new
      expect(response).to render_template(:new)
    end

    it 'can redirect to user page if logged in' do
      User.create(email: "test@test.com", password: "testPassword")
      controller.session[:user_id] = User.first.id
    end
  end
end
