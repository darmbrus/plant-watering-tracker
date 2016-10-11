class Plant < ApplicationRecord
  has_many :waterings

  def latest_watering
    # TODO handle no waterings
    self.waterings.order(date: :desc).first
  end

  def needs_water?
    # TODO handle no waterings
    Date.today() - self.latest_watering.date > self.days_per_watering
  end
end
