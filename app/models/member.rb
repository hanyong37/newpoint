class Member < ApplicationRecord
  validates :default_ship_week_day, :membership_card_number ,:membership_id, :name, :mobile, :address ,:validate_from, :validate_to, presence: :true
  has_many :orders, dependent: :restrict_with_error
  belongs_to :membership

  after_create :set_defaults
  enum default_ship_week_day: {
    星期一: 1,
    星期二: 2,
    星期三: 3,
    星期四: 4,
    星期五: 5
  }

  def wx_connected?
    wxcode.present? ? '是':'否'
  end

  def recieved_orders
    orders.recieved.size
  end

  def total_count
    52
  end

  def remaining_count
    total_count - used_count
  end

  def used_count
   orders.valid_order.size
  end

  def membership_number
    membership.name.first + created_at.strftime('%Y%m%M%S')
  end

  private
  def set_defaults
    update(default_ship_mobile: mobile, default_ship_address: address, default_ship_reciever: name)
  end
end
