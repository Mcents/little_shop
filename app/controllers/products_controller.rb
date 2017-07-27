class ProductsController < ApplicationController

def new
  @product = Product.new
end


def create
  @categories = Category.find_by(params[:category_ids])
  @product = @categories.products.new(product_params)
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
end

def destroy
  @product = Product.find(params[:id])
  @product.destroy

  redirect_to products_path
end

private

def product_params
  params.require(:product).permit(:name, :description, :price, category_ids: [])
end


end
