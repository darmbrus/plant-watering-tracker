require 'rails_helper'
describe Plant do
  let(:plant) { Plant.new(name: "Test Name",
                          species: "Test Species",
                          days_per_watering: 10,
                          start_date: Date.today()
                          )}
  let(:user) { User.create(email: "test.user@place.com",
                           password: "testPassword")}
  let(:watering1) { Watering.new(amount: 100,
                                date: Date.today()-2,
                                user: user
                                )}
  let(:watering2) { Watering.new(amount: 200,
                                date: Date.today()-1,
                                user: user
                                )}

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
      plant.save
      plant.waterings << watering2
      plant.waterings << watering1
      expect(plant.latest_watering.amount).to eq 200
    end
  end

  describe '#days_since_watering' do
    it 'can return the days since the last watering' do
      plant.save
      plant.waterings << watering1
      expect(plant.days_since_watering).to eq 2
    end
  end

  describe '#needs_water' do
    it 'can return true if it has not been watering' do
      plant.save
      expect(plant.needs_water?).to eq true
    end

    it 'can return false if it does not need water' do
      plant.save
      plant.waterings << watering1
      expect(plant.needs_water?).to eq false
    end

    it 'can return true if it needs to be watered' do
      plant.save
      watering1.date = Date.today() - 11
      plant.waterings << watering1
      expect(plant.needs_water?).to eq true
    end
  end
end
