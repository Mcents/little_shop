class OrdersController < ApplicationController

  def index
    @orders = Order.where(user_id: current_user.id)
  end

  def show

    # @order = Order.find(params[:id])
    @user = User.last
    @order = @user.orders.find(params[:id])

    # current_user
    # @user  = User.find(params[:user_id])
  end

  def create
    order = Order.new(user_id: current_user.id)
    session[:shopping_cart].keys.each do |product_id|
      (session[:shopping_cart][product_id.to_s]).times do order.products << Product.find_by(id: product_id)
      end
    end
    order.save
    session[:shopping_cart] = {}
    redirect_to orders_path
    flash[:notice]  = "Order was successfully placed"
  end
end
