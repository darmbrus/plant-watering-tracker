class PlantsController < ApplicationController
  def new
    if helpers.current_user
      render 'new'
    else
      redirect_to '/login'
    end
  end
end
