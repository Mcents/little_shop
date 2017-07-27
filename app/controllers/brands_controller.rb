class BrandsController < ApplicationController

  def new

  end

  def show
    @brand = Brand.find(params[:id])
    @brand_products = @brand.products
    #refactor, push down to class method
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

  def edit
    @brand = Brand.find(params[:id])
  end

  def update
    @brand = Brand.find(params[:id])
    @brand.update(brand_params)
    if @brand.save(brand_params)
      flash[:notice] = "Brand #{@brand.name} updated!"
      redirect_to brand_path(@brand)
    else
      render :edit
    end
  end

  private

  def brand_params
    params.require(:brand).permit(:name)
  end


end
