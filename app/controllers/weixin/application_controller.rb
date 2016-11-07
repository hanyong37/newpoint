class Weixin::ApplicationController < ApplicationController
  layout 'shop_weui'

  before_action :check_member_authentication

  private

  def check_member_authentication
    redirect_to '/auth/wechat' if session[:current_member_id].blank?
  end
end
