class ShoppingCartsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    id = params[:product_id].to_s
    product = Product.find_by(id: id)
    session[:shopping_cart] ||= {}
    session[:shopping_cart][id] = (session[:shopping_cart][id] || 0) + 1
    flash[:notice] = "#{pluralize(session[:shopping_cart][id], product.name)} in Cart"
    redirect_to products_path
  end
end
