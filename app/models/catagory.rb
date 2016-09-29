class Catagory < ApplicationRecord
  validates :name , presence: true
  enum status: {
    active: 1,
    archived: 0,
    inactive: -1}
  has_many :products
end
