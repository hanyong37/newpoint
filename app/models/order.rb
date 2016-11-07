class Order < ApplicationRecord
  validates :member_id, :status, presence: :true
  has_many :lineitems, dependent: :destroy
  belongs_to :member


  enum status: {
    draft: 0,       #草稿，购物车
    submitted: 1,   #已提交，订单无法再修改
    preparing: 2,   #备货中
    delivering: 3,  #送货中
    recieved: 4,    #已收货，订单完成
    stared: 5,      #已评价
    cancelled: -1   #已取消
  }

  def sum_price
    self.lineitems.sum(:price)
  end
  def li_number
    self.lineitems.size
  end

end
