class Plant < ApplicationRecord
  has_many :waterings
  validates :name, presence: true
  validates :species, presence: true
  validates :days_per_watering, presence: true, numericality: { greater_than: 0 }
  validates :start_date, presence: true

  def latest_watering(num = 1)
    # TODO handle no waterings
    if num == 1
      self.waterings.order(date: :desc).first
    else
      self.waterings.order(date: :desc).first(num)
    end
  end

  def days_since_watering
    if self.latest_watering
      (Date.today() - self.latest_watering.date).to_i
    else
      -1
    end
  end

  def needs_water?
    if self.latest_watering
      self.days_since_watering > self.days_per_watering
    else
      true
    end
  end
end
