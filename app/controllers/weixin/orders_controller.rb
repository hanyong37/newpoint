class Weixin::OrdersController < Weixin::ApplicationController
  def index
    @orders = Order.my_order(session[:current_member_id])
  end
end
