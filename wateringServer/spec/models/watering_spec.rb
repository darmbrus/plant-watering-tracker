require 'rails_helper'

describe Watering do
  let(:plant) { Plant.create(name: "Test Name",
                          species: "Test Species",
                          days_per_watering: 10,
                          start_date: Date.today()
                          )}

  let(:user) { User.create(email: "test.user@place.com",
                           password: "testPassword"
                           )}

  let(:watering) { Watering.new(amount: 200,
                                date: Date.today(),
                                plant: plant,
                                user: user
                                )}

  context 'validations' do
    it 'can save' do
      expect(watering.save).to eq true
    end

    it 'wont save if the amount is blank' do
      watering.amount = nil
      expect(watering.save).to eq false
      expect(watering.errors.full_messages).to eq ["Amount can't be blank", "Amount is not a number"]
    end

    it 'wont save if the amount is negative' do
      watering.amount = -1
      expect(watering.save).to eq false
      expect(watering.errors.full_messages).to eq ["Amount must be greater than 0"]
    end

    it 'wont save if the date is blank' do
      watering.date = nil
      expect(watering.save).to eq false
      expect(watering.errors.full_messages).to eq ["Date can't be blank"]
    end

    it 'wont save if the plant is blank' do
      watering.plant = nil
      expect(watering.save).to eq false
      expect(watering.errors.full_messages).to eq ["Plant must exist"]
    end

    it 'wont save if the user is blank' do
      watering.user = nil
      expect(watering.save).to eq false
      expect(watering.errors.full_messages).to eq ["User must exist"]
    end
  end
end
