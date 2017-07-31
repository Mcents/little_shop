class OrdersController < ApplicationController

  def index
    @orders = Order.where(user_id: current_user.id)
  end

  def show
    @user = User.last
    @order = @user.orders.find(params[:id])
  end
end
