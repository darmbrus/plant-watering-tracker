class Plant < ApplicationRecord
  has_many :waterings

  def latest_watering
    self.waterings.order(date: :desc).first
  end

  def needs_water?
    
  end
end
