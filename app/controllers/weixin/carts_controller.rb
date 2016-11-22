class Weixin::CartsController < Weixin::ApplicationController
  def show
    @cart = Order.get_cart_order(session[:current_member_id])
  end

  # 客户可以保存购物车，删除商品，或者提交为订单！
  def update
    @cart = Order.get_cart_order(session[:current_member_id])

    #点保存按钮
    if  params[:save].present?
      if @cart.update(params.require(:order).permit(:ship_reciever, :ship_address, :ship_mobile, :memo))
        redirect_to weixin_cart_path(@cart), notice: '购物车保存成功！'
      else
        redirect_to weixin_cart_path(@cart), notice: '保存失败！'
      end

    #点提交按钮
    elsif params[:submit].present?
      ocs = OrderCheckService.new(@cart)

      if ocs.is_valid
        if @cart.update(params.require(:order).permit(:ship_reciever, :ship_mobile, :ship_mobile, :memo).merge({status:'submitted'}))
          #同步更新客户送货地址
          @cart.member.update(
            default_ship_reciever: @cart.ship_reciever,
            default_ship_mobile: @cart.ship_mobile,
            default_ship_address: @cart.ship_address )

          redirect_to weixin_cart_path(@cart), notice: '提交订单成功！'
        else
          redirect_to weixin_cart_path(@cart), notice: '保存失败！'
        end
      else
          redirect_to weixin_cart_path(@cart), notice: ocs.msg
      end

    #点删除(商品)按钮
    elsif params[:delete_lineitem].present?
      if Lineitem.destroy(params[:delete_lineitem].keys.first)
        redirect_to weixin_cart_path(@cart), notice: '删除商品成功！'
      else
        redirect_to weixin_cart_path(@cart), notice: '删除失败！'
      end
    end
  end
end
