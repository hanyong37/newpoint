class Membership < ApplicationRecord
  validates :name, :order_limit, presence: :true
end
