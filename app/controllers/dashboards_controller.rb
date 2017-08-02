class DashboardsController < ApplicationController
  def index
    @products = Product.order("created_at ASC").limit(4)
  end

end
