require 'rails_helper'
describe Plant do
  let(:plant) { Plant.new(name: "Test Name",
                          species: "Test Species",
                          days_per_watering: 10,
                          start_date: Date.today()
                          )}
  let(:user) { User.create(email: "test.user@place.com",
                           password: "testPassword")}
  let(:watering) { Watering.new()}

  describe 'validations' do
    it 'can save' do
      expect(plant.save).to eq true
    end

    it 'wont save if the name is blank' do
      plant.name = nil
      expect(plant.save).to eq false
      expect(plant.errors.full_messages).to eq ["Name can't be blank"]
    end

    it 'wont save if the species is blank' do
      plant.species = nil
      expect(plant.save).to eq false
      expect(plant.errors.full_messages).to eq ["Species can't be blank"]
    end

    it 'wont save if the days_per_watering is blank' do
      plant.days_per_watering = nil
      expect(plant.save).to eq false
      expect(plant.errors.full_messages).to eq ["Days per watering can't be blank", "Days per watering is not a number"]
    end

    it 'wont save if the days_per_watering is negative' do
      plant.days_per_watering = -1
      expect(plant.save).to eq false
      expect(plant.errors.full_messages).to eq ["Days per watering must be greater than 0"]
    end
  end



  describe '#latest_watering' do
    it 'can return the latest watering'  do
    end
  end
end
