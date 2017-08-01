class BrandsController < ApplicationController

  def index
    @brands = Brand.all
  end

  def new

  end

  def show
    @brand = Brand.find(params[:id])
    @brand_products = @brand.products
    #refactor, push down to class method
  end

  def edit
    @brand = Brand.find(params[:id])
  end

  def update
    @brand = Brand.find(params[:id])
    @brand.update_attributes(brand_params)
    flash[:notice] = "Brand #{@brand.name} updated!"
    redirect_to brand_path(@brand)
  end

  def create
    @brand = Brand.new(brand_params)
    if @brand.save
      flash[:notice] = "#{@brand.name} added!"
      redirect_to brand_path(@brand)
    else
      redirect_to new_brand_path
    end
  end

  def destroy
    @brand = Brand.find(params[:id])
    @brand.destroy
    flash[:notice] = "#{@brand.name} successfully deleted."
    redirect_to brands_path
  end

  private

  def brand_params
    params.require(:brand).permit(:name)
  end


end
