class Weixin::SessionsController < Weixin::ApplicationController
  layout :register
  skip_before_action :check_member_authentication
  def create
    member = Member.find_by_wxcode(params[:code])

    if member.blank?
      session[:un_registered_openid] = params[:code]
      redirect_to new_weixin_register_path
      return
    end

    session[:current_member_id] = member.id
    redirect_to weixin_root_path
  end

end
