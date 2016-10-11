class Plant < ApplicationRecord
  has_many :waterings

  def latest_watering(num = 1)
    # TODO handle no waterings
    if num == 1
      self.waterings.order(date: :desc).first
    else
      self.waterings.order(date: :desc).first(num)
    end
  end

  def needs_water?
    if self.latest_watering
      Date.today() - self.latest_watering.date > self.days_per_watering
    else
      true
    end
  end
end
