class ShoppingCartsController < ApplicationController
  def create
    product = Product.find(params[:product_id])
    flash[:notice] = "1 #{product.name} added."
    redirect_to root_path
  end
end
