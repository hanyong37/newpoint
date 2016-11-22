class Weixin::ProductsController < Weixin::ApplicationController

  def index
    @products = Product.shop_view
    @cart = Order.get_cart_order(session[:current_member_id])
  end

  def show
    @product = Product.find(params[:id])
    @lineitem = Lineitem.new(product_id: @product.id)
  end
end
