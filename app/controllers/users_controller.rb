class UsersController < ApplicationController

  def new

  end

  def edit
  end

  def update
  end

  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome, #{@user.username}"
      redirect_to "/dashboard"
    else
      flash[:notice] = "Invalid credentials"
      redirect to new_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
