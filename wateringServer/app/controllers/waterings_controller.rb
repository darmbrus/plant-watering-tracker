class WateringsController < ApplicationController
  def show
  end

  def new
    @plant = Plant.find(params[:plant_id])
    @watering = Watering.new
  end

  def create
    @watering = Watering.new(watering_params)
    if @watering.valid?
      @watering.save
      redirect_to helpers.current_user
    else
      # TODO Add error processing to watering save
    end
  end

  private

  def watering_params
    params.require(:watering).permit(:amount, :date).
      merge(plant: Plant.find(params[:plant_id])).
      merge(user: helpers.current_user)
  end
end
