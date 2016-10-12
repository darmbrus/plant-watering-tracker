require 'rails_helper'
describe Plant do
  let(:plant) { Plant.new }
  describe '#latest_watering' do
    it 'can return the latest watering'  do
      plant = Plant.create(name: "test", species: 'test', days_per_watering: 2)
      watering1 = Watering.create(amount: 200, date: Date.today())
      watering2 = Watering.create(amount: 200, date: Date.today())
      plant.waterings << watering1
      plant.waterings << watering2
      puts '-------------------------------------------'
      puts watering1.object_id
      puts watering2.object_id
      puts plant.latest_watering.object_id
      puts plant.latest_watering.class
      puts '-------------------------------------------'
      # expect(plant.latest_watering)
    end
  end
end
