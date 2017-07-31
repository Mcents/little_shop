class OrdersController < ApplicationController

  def index
    if current_user.nil?
      redirect_to "public/404"
    else
      @orders = Order.where(user_id: current_user.id)
    end
  end

  def show
    @user = current_user
    @order = @user.orders.find(params[:id])
  end

end
