class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def description
    render plain: set_product.description
  end

  def inventory
    if set_product.inventory
      true.to_s
    else
      false.to_s
    end
  end

  private

  def set_product
    Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price, :description, :inventory)
  end
end
