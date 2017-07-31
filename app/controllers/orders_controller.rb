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
    else
      flash[:notice] = "Oops! We couldn't process your order. \n
                        Please try again in a moment. \n
                        If the probelm persists, contact the site administrator."
    end
  end
end
