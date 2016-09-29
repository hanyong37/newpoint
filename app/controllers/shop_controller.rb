class ShopController < ApplicationController
  #before_action :set_products, only: [:index, :hot, :new, :favorite]
  layout 'shop'

  def index
    @products = Product.all
  end

  def hot
  end

  def favorite
  end

  private
end
