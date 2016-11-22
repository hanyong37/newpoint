class Weixin::AddItemsController < Weixin::ApplicationController
  def create
    @cart = Order.get_cart_order(session[:current_member_id])
    @cart.add_amount(params[:product_id])
    #redirect_to weixin_products_path
    render 'weixin/products/refresh_index.js'
  end
end
