class User < ApplicationRecord
  before_save { self.email = self.email.downcase}
  validates :email, presence: true
  has_secure_password

  has_many :waterings
end
