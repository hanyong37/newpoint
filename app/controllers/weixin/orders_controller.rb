class Weixin::OrdersController < Weixin::ApplicationController
  def index
    @orders = Order.my_order(session[:current_member_id])
  end

  def show
    @order = Order.find_by_id(params[:id])
  end

  def update
    @order = Order.find_by_id(params[:id])
    redirect_to(weixin_order_path(@order), notice: '无法取消！') unless @order.submitted?
    if @order.update(status: 'cancelled')
      redirect_to(weixin_order_path(@order), notice: '取消成功！')
    else
      redirect_to(weixin_order_path(@order), notice: '出错了！')
    end
  end
end
