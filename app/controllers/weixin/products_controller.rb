class Weixin::ProductsController < Weixin::ApplicationController

  def index
    @products = Product.shop_view
  end

  def show
    @product = Product.find(params[:id])
    @lineitem = Lineitem.new(product_id: @product.id)
  end
end
