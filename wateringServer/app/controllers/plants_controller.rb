class PlantsController < ApplicationController
  def new
    if helpers.current_user
      @plant = Plant.new
      render 'new'
    else
      redirect_to '/login'
    end
  end

  def create
    @plant = Plant.new(plant_params)

    if @plant.valid? && helpers.current_user
      @plant.save
      redirect_to helpers.current_user
    else
      @errors = @plant.errors.full_messages
      render 'new'
    end
  end

  def show
    @plant = Plant.find(params[:id])
  end

  private

  def plant_params
    params.require(:plant).
      permit(:name, :species, :days_per_watering, :start_date)
  end
end
