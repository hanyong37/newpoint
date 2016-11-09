class Weixin::AddToCartsController < Weixin::ApplicationController
  def create
    @lineitem = Lineitem.new(params.require(:lineitem).permit(:product_id, :amount))
    cart = Order.get_cart_order(session[:current_member_id])

    #是否已经添加过产品?
    if cart.lineitems.find_by_product_id(@lineitem.product_id).present?
      li = cart.lineitems.find_by_product_id(@lineitem.product_id)
      li.amount += @lineitem.amount
      if li.save
        flash[:notice] = '添加购物车成功！'
      else
        flash[:notice] = '出现错误！'
      end
    else
      @lineitem.order= cart
      if @lineitem.save
        flash[:notice] = '添加购物车成功！'
      else
        flash[:notice] = '出现错误！'
      end
    end

    respond_to do |format|
      format.html { redirect_to weixin_product_path(@lineitem.product_id)}
    end
  end
end
