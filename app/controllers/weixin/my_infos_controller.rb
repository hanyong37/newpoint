class Weixin::MyInfosController < Weixin::ApplicationController
  def show
    @member = Member.find_by_id(session[:current_member_id])
  end
end
