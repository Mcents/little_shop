 class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :set_shopping_cart
  before_action :all_categories

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def set_shopping_cart
    @shopping_cart ||= ShoppingCart.new(session[:shopping_cart])
  end

  def current_admin?
    current_user && current_user.admin?
  end

  def all_categories
    @categories = Category.all
  end
end
