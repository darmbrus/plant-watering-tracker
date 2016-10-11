class Plant < ApplicationRecord
  has_many :waterings

  def latest_watering
    # TODO handle no waterings
    self.waterings.order(date: :desc).first
  end

  def needs_water?
    if self.latest_watering
      Date.today() - self.latest_watering.date > self.days_per_watering
    else
      true
    end
  end
end
