require 'rails_helper'

describe PlantsController do
  before(:each) do
    User.create(email: "test@test.com", password: "testPassword")
    controller.session[:user_id] = User.first.id
  end

  describe 'GET #new' do
    it 'can render the :new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end
end
