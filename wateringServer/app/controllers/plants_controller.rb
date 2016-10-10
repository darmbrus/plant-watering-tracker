class PlantsController < ApplicationController
  def new
    if current_user
    else
      redirect_to '/login'
    end
  end
end
