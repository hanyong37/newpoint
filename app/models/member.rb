class Member < ApplicationRecord
  validates :name, :mobile, :address ,:validate_from, :validate_to, presence: :true
  has_many :orrders
end
