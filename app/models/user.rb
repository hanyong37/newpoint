class User < ApplicationRecord
  validates :name, :password, presence: true
  has_secure_password
  has_one :member
end
