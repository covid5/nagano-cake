class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product_new = Product.new
  end

  def create
    product_new = Product.new(product_params)
    product_new.save
    redirect_to products_path
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
  end

  def update
  end



  private

  def product_params
    params.require(:product).permit(:image, :name, :description, :genre_id, :price, :salling_status)

  end
end
