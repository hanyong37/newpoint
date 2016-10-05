class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  def new
  end

  def create
    user = User.find_by_name(params[:session][:username])
    if ( user && user.authenticate(params[:session][:password]))
      session[:user_id] = user.id
      session[:user_name] = user.name
      redirect_to products_path
    else
      flash[:alert] = "错误的用户名密码！请重试"
      redirect_to new_session_path
    end
  end

  def destroy
    session[:user_id] = nil
    session[:user_name] = nil
    redirect_to new_session_path
  end

  def session_params
    params.require(:session).permit(:username, :password)
  end
end
