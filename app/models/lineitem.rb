class Lineitem < ApplicationRecord
  validates :product_id, :amount , presence: true
  belongs_to :product
  belongs_to :order
end
