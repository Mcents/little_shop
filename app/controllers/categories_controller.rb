class CategoriesController < ApplicationController

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
      render :404
      #refactor protect category "wildcard" route  get navbar to show on 404
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

end
