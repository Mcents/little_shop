class ProductsController < ApplicationController

  def new
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
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
    params.require(:product).permit(:name, :description, :price)
  end
end
