class Weixin::CartsController < Weixin::ApplicationController
  def show
    @cart = Order.get_cart_order(session[:current_member_id])
  end

  # 客户可以保存购物车，删除商品，或者提交为订单！
  def update
    @cart = Order.get_cart_order(session[:current_member_id])
    if  params[:save].present?
      if @cart.update(params.require(:order).permit(:ship_reciever, :ship_address, :ship_mobile, :memo))
        redirect_to weixin_cart_path(@cart), notice: '购物车保存成功！'
      else
        redirect_to weixin_cart_path(@cart), notice: '保存失败！'
      end

    elsif params[:submit].present?
      if @cart.update(params.require(:order).permit(:ship_reciever, :ship_mobile, :ship_mobile, :memo).merge({status:'submitted'}))
        @cart.member.update(
          default_ship_reciever: @cart.ship_reciever,
          default_ship_mobile: @cart.ship_mobile,
          default_ship_address: @cart.ship_address )

        redirect_to weixin_cart_path(@cart), notice: '提交订单成功！'
      else
        redirect_to weixin_cart_path(@cart), notice: '提交失败！'
      end

    elsif params[:delete_lineitem].present?
      if Lineitem.destroy(params[:delete_lineitem].keys.first)
        redirect_to weixin_cart_path(@cart), notice: '删除商品成功！'
      else
        redirect_to weixin_cart_path(@cart), notice: '删除失败！'
      end
    end
  end
end
