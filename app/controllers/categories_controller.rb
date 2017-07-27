class CategoriesController < ApplicationController

  def index
    @categories = Category.all 
  end

  def new

  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "#{@category.name} added!"

      redirect_to "/#{@category.name}"
    else
      render :new
    end
  end

  def show
    @category = Category.find_by(name: params[:category_name])
    if @category
      @product = @category.products
    else
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
