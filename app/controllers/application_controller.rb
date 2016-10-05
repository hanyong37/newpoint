class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout 'admin'

  before_action :require_login

  private
  def require_login
    unless session && session[:user_id]
      flash[:error] = "请先登录！"
      redirect_to new_session_path
    end
  end

end
