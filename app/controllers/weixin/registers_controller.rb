class Weixin::RegistersController < Weixin::ApplicationController
  layout 'register'
  skip_before_action :check_member_authentication

  def new
    @member = Member.new
  end

  def create
    @member = Member.find_by_mobile(params[:member][:mobile])
    if @member.blank?
      redirect_to new_weixin_register_path
      flash[:notice] = '您还没有成为我们的会员，请与我们联系：电话 13912344321'
    else
      @member.wxcode = params[:member][:wxcode]
      @member.save
      session[:current_member_id] = @member.id
      redirect_to weixin_root_path
    end
  end
end
