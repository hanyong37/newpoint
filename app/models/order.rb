class Order < ApplicationRecord
  validates :member_id, :status, presence: :true
  #validates_uniqueness_of :member_id, scope: draft

  has_many :lineitems, dependent: :destroy
  belongs_to :member

  #before_save :update_ship_info, if: "self.draft?"
  after_create :set_ship_info, if: "draft? || submitted?"

  default_scope ->{order(id: :desc)}
  scope :my_order, ->(member_id) {where("member_id = '?' and status <> ?", member_id, Order.statuses[:draft]).order(updated_at: :desc) if member_id.present?}

  enum status: {
    draft: 0,       #草稿，购物车
    submitted: 1,   #已提交，订单无法再修改
    preparing: 2,   #备货中
    delivering: 3,  #送货中
    recieved: 4,    #已收货，订单完成
    stared: 5,      #已评价
    cancelled: -1   #已取消
  }

  def amount_of_product(product_id)
    lineitems.find_by_product_id(product_id).try(:amount) || 0
  end

  def self.get_cart_order(member_id)
    m = Member.find_by_id member_id
    return if m.blank?
    Order.find_or_create_by(member_id: m.id, status: 'draft')
  end

  def add_amount(product_id)
    li = lineitems.find_by_product_id(product_id)
    li.present? ? li.update(amount: li.amount+1) : Lineitem.create(product_id: product_id, order_id: id, amount: 1)
  end

  def reduce_amount(product_id)
    li = lineitems.find_by_product_id(product_id)
    if li.present?
      li.amount > 1 ? li.update(amount: li.amount-1) : li.destroy
    end
  end

  def brief
    "#{lineitems.first.product.name}\"等#{lineitems.size}种共#{total_amount}件商品。"
  end

  def product_amount(product)
    lineitems.find_by_product_id(product.id).try(:amount) || 0
  end

  def sum_price
    self.lineitems.sum(:price)
  end

  def li_number
    self.lineitems.size
  end

  def total_amount
    lineitems.sum(:amount)
  end

  private

  def update_ship_info
    member.update(
       default_ship_reciever: ship_reciever,
       default_ship_mobile: ship_mobile,
       default_ship_address: ship_address )
  end

  def set_ship_info
    update(
       ship_reciever: member.default_ship_reciever,
       ship_mobile: member.default_ship_mobile,
       ship_address: member.default_ship_address )
  end
end
