class ShoppingCartsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    product = Product.find(params[:product_id])

    @shopping_cart.add_product(product.id)
    session[:shopping_cart] = @shopping_cart.contents

    flash[:notice] = "#{pluralize(@shopping_cart.count_of(product.id), product.name)} in Cart"
    redirect_to products_path
  end

  def index
    @products = Product.all
  end

  def destroy
    product = Product.find(params[:product_id])
    @shopping_cart.remove_product(params[:product_id])
    flash[:notice] = %Q[Successfully removed <a href="/products/#{product.id}"> #{product.name}</a> from your cart].html_safe
    session[:shopping_cart] = @shopping_cart.contents
    redirect_to cart_path
  end

  def update
    @shopping_cart.change_quantity(params[:product_id], params[:quantity_change])
    session[:shopping_cart] = @shopping_cart.contents
    redirect_to cart_path
  end

  def checkout
    # order = Order.new(user_id: current_user.id)
    # session[:contents].keys.each do |product_id|
    #   (contents[:product_id]).times do order.products << Product.find_by(:id product_id)
    # end
  end

end
