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

  def create
    @new_order = Order.new(user_id: current_user.id)
    populate_new_order
    clean_cart
    redirect_to orders_path
    flash[:notice]  = "Order was successfully placed"
  end

private

  def populate_new_order
    session[:shopping_cart].keys.each do |product_id|
      (session[:shopping_cart][product_id.to_s]).times do @new_order.products << Product.find_by(id: product_id)
      end
    end
  end

  def clean_cart
    if @new_order.save
      session[:shopping_cart] = {}
    end
  end
end
