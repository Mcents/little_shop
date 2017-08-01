class UsersController < ApplicationController
  before_action :find_user, only: [:edit, :update]

  def new

  end

  def show
    if current_user
      @user = current_user
    else
      render file: 'public/404', layout: false
    end
  end

  def edit
    render file: 'public/404', layout: false unless current_user == @user
  end

  def update
    if @user.update(user_params)
      redirect_to dashboard_path
    else
      render :edit
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome, #{@user.username}"
      redirect_to "/dashboard"
    else
      flash[:notice] = "Invalid credentials"
      redirect_to new_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
