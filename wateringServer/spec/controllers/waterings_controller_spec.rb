require 'rails_helper'

describe WateringsController do
  before(:each) do
    User.create(email: "test@test.com", password: "testPassword")
    controller.session[:user_id] = User.first.id
  end
  let(:plant) { Plant.create(name: "Test Name",
                            species: "Test Species",
                            days_per_watering: 10,
                            start_date: Date.today()
                            ) }

  describe 'GET #new' do
    it 'can render the :new template' do
      get :new, params: { plant_id: plant.id }
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    it 'can create the new' do
      post :create, params: { plant_id: plant.id, watering: { amount: 200,
                                                              date: Date.today()}}
      expect(Watering.last.amount).to eq 200
    end
  end
end
