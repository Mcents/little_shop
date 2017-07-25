class UsersController < ApplicationController

  def new

  end
  
  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params) 
    if @user.save
      flash[:notice] = "Welcome, #{@user.username}"
      redirect_to root_path
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
