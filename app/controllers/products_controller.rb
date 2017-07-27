class ProductsController < ApplicationController

def new
end

def create
  @product = Product.new(product_params)
  if @product.save
    redirect_to products_path
  else
    render :new
  end
end

def show
  @product = Product.find(params[:id])
end

def index
  @products = Product.all
  @shopping_cart = ShoppingCart.new(session[:shopping_cart])
end

def destroy
  @product = Product.find(params[:id])
  @product.destroy

  redirect_to products_path
end

private

def product_params
  params.require(:product).permit(:name, :description, :price)
end

end
