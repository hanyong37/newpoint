class Member < ApplicationRecord
  validates :membership_id, :name, :mobile, :address ,:validate_from, :validate_to, presence: :true
  has_many :orders, dependent: :restrict_with_error
  belongs_to :membership

  after_create :set_defaults

  def wx_connected?
    wxcode.present? ? '是':'否'
  end

  def recieved_orders
    orders.recieved.size
  end

  private
  def set_defaults
    update(default_ship_mobile: mobile, default_ship_address: address, default_ship_reciever: name)
  end
end
