require 'date'
require 'active_support'
class OrderCheckService

  attr_reader :msg, :is_valid

  def initialize(order)
    @order = order
    @is_valid = true
    @msg = ''

    member = @order.member

    #订单是否合规
    if not Date.today.on_weekend?
      #每周只能在周六，周日提交订单；
      @msg = "请在周六和周日提交下周的订单。"
      @is_valid = false
    elsif have_submitted_order_in_this_week(member)
      #每周只能提交一次订单；
      @msg = "一周只能提交一次订单。"
      @is_valid = false
    elsif not Date.today >= member.validate_from && Date.today <= member.validate_to
      #客户是否在有效期
      @msg = '您会员卡不在有效期内。' and @is_valid = false
    elsif member.membership.order_limit < @order.total_amount
      #总份数符合会员卡资格
      @msg = "您一次只能选购#{member.membership.order_limit }份商品。"
      @is_valid = false
    elsif not order.valid?
      @msg = "订单数据不合规!"
      @is_valid = false
    else
      #每份商品数量符合限制
      @order.lineitems.each do |li|
        if li.amount > li.product.limit
          @msg = "商品#{li.product.name}一次只能选购#{li.product.limit}份！"
          @is_valid = false
        end
      end
    end
  end

  private

  def have_submitted_order_in_this_week(member)
    member.orders.submitted.any? do |order|
      Date.today.beginning_of_week <= order.updated_at && Date.today.end_of_week >= order.updated_at
    end
  end

end
