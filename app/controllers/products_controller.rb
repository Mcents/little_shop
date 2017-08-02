class ProductsController < ApplicationController

  def new
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

def index
  @products = Product.search(params[:query])
end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    if @product.save
      flash[:success] = "Product Updated!"
      redirect_to product_path(@product)
    else
      flash[:notice] = "Invalid Credentials"
      render :edit
    end
  end


  private

  def product_params
    params.require(:product).permit(:name, :description, :price)
  end
end
