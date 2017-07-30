class Admin::ProductsController < Admin::BaseController

  def new
    @product = Product.new
    @categories = Category.all
  end

  def edit
    @product = Product.find(params[:id])
    @categories = Category.all
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to admin_products_path
    else
      redirect_to edit_admin_product_path(@product, name: @product.name)
    end
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_dashboard_path
    else
      redirect_to new_admin_product_path
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
    params.require(:product).permit(:name, :description, :price, :brand_id, category_ids: [])
  end
end
