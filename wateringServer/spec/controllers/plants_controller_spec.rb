require 'rails_helper'

describe PlantsController do

  describe 'GET #new' do
    it 'can render the :new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end
end
