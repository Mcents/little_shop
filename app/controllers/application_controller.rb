class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :shopping_cart
  
  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def shopping_cart
    @shopping_cart = ShoppingCart.new(session[:shopping_cart])
  end

end
