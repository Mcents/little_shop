class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:notice] = "Successful login"
      user_type(@user)
    end
  end

  def show
  end

  def destroy
    session[:user_id] = nil
    session[:shopping_cart].clear
    redirect_to root_path
  end

  def user_type(user)
    if user.admin?
      redirect_to admin_dashboard_path
    else
      redirect_to dashboard_path
    end
  end
end
