class BrandsController < ApplicationController

  def index
    @brands = Brand.all
  end

  def new

  end

  def show
    @brand = Brand.find(params[:id])
    @brand_products = @brand.products
  end

  def edit
    @brand = Brand.find(params[:id])
  end

  def update
    @brand = Brand.find(params[:id])
    if @brand.update_attributes(brand_params)
      flash[:notice] = "Brand #{@brand.name} updated!"
      redirect_to brand_path(@brand)
    else
      render :edit
    end
  end

  def create
    @brand = Brand.new(brand_params)
    if @brand.save
      flash[:notice] = "#{@brand.name} added!"
      redirect_to brand_path(@brand)
    else
      render :new
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
