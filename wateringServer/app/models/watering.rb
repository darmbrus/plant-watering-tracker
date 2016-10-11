class Watering < ApplicationRecord
  belongs_to :user
  belongs_to :plant

  validates :date, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
end
