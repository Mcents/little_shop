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

  def remove
    @shopping_cart.remove_product(params[:product_id])
    redirect_to cart_path
  end

end
