class Admins::ProductsController < ApplicationController

  def index
    @products = Product.all.page(params[:page]).per(10)
  end

  def new
    @product = Product.new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  private

  def product_params
    params.require(:product).permit(:genre_id, :name, :explanation, :image_id, :price, :is_active)
  end

end
