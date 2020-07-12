class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    product = Product.new(product_params)
    product.save
    redirect_to products_path
  end

  def show
  end

  def edit
  end

  def update
  end



  private

  def product_params
    params.require(:product).permit(:image_id, :name, :description, :genre_id, :price, :salling_status)

  end
end
