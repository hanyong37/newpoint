class Weixin::RemoveItemsController < Weixin::ApplicationController
  def create
    @cart = Order.get_cart_order(session[:current_member_id])
    @cart.reduce_amount(params[:product_id])
    render 'weixin/products/refresh_index.js'
  end
end
