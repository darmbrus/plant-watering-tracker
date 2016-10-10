class User < ApplicationRecord
  before_save { self.email = self.email.downcase}
  has_secure_password
end
