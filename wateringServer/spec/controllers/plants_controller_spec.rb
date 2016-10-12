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

  describe 'POST #create' do
    it 'can redirect after a success' do
      post :create, params: { plant: { name: "testName",
        species: "testSpecies",
        days_per_watering: 10,
        start_date: Date.today()
        }}
        expect(response).to redirect_to(
          "http://test.host/users/#{User.first.id}")
    end

    it 'can render new after a failure' do
      post :create, params: { plant: {name: "testName"}}
      expect(response).to render_template(:new)
    end

    it 'can pass errors back after a failure' do
      post :create, params: { plant: { name: "testName",
        species: "",
        days_per_watering: 10,
        start_date: Date.today()
        }}
        expect(assigns(:errors)). to eq ["Species can't be blank"]
    end
  end

  describe 'GET #show' do
    it 'can show a plant page' do
      plant = Plant.create(name: "Test Name",
                        species: "Test Species",
                        days_per_watering: 10,
                        start_date: Date.today()
                        )
      get :show, params: { id: plant.id }
      expect(response).to render_template(:show)
    end
  end
end
