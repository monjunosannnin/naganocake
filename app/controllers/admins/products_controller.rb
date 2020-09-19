class Admins::ProductsController < ApplicationController

  # before_action :authenticate_admin!
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all.page(params[:page]).per(10)
  end

  def new
    @product = Product.new
    @product_image = ProductImage.new
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to admins_product_path(@product)
    flash[:notice] = 'new product was successfully created.'
  end

  def show
  end

  def edit
  end

  def update
    if@product.update(product_params)
      flash[:notice] = 'It was successfully updated.'
      redirect_to admins_product_path(@product.id)
    else
      redirect_back(fallback_location: root_path)
  end

  def destroy
  end

  private

  def product_params
    params.require(:product).permit(:genre_id, :name, :explanation, :image_id, :price, :is_active)
  end

  def set_product
    @product = Product.find(params[:id])
  end

end
