class Weixin::RegistersController < Weixin::ApplicationController
  layout 'register'
  skip_before_action :check_member_authentication

  def new
    @member = Member.new
  end

  def create
    @member =  Member.where(mobile: params[:member][:mobile], membership_card_number: params[:member][:membership_card_number]).try(:first)
    if @member.blank?
      redirect_to new_weixin_register_path
      flash[:notice] = '您还好像还没有成为我们的会员，请与我们联系：电话 13912344321'
    else
      @member.wxcode = params[:member][:wxcode]
      @member.save
      session[:current_member_id] = @member.id
      redirect_to root_path
    end
  end
end
