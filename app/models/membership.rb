class Membership < ApplicationRecord
  validates :name, :order_limit, presence: :true
  has_many :members, dependent: :restrict_with_error
end
