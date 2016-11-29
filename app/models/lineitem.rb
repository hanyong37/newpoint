class Lineitem < ApplicationRecord
  validates :product_id, :amount , presence: true
  validates_uniqueness_of :order_id ,scope: :product_id
  belongs_to :product
  belongs_to :order
  #before_save :calculate_price

  private
 # def calculate_price
 #   self.price = amount * product.price
 #   self.description = '产品明细描述'
 # end
end
