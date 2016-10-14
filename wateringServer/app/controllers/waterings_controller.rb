class WateringsController < ApplicationController
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
      @plant = Plant.find(params[:plant_id])
      @errors = @watering.errors.full_messages
      render 'new'
    end
  end

  private

  def watering_params
    params.require(:watering).permit(:amount, :date).
      merge(plant: Plant.find(params[:plant_id])).
      merge(user: helpers.current_user)
  end
end
