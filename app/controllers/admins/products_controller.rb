class Admins::ProductsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_product, only: [:show, :edit, :update]

  def index
    @products = Product.all.page(params[:page]).per(10)
    @page_title = "商品一覧"
  end

  def new
    @product = Product.new
    @genres = Genre.all.map {|genre| [genre.name, genre.id]}
    @page_title = "商品新規登録"
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admins_product_path(@product.id)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def show
    @page_title = "商品詳細"
  end

  def edit
    @genres = Genre.all.map {|genre| [genre.name, genre.id]}
    @page_title = "商品編集"
  end

  def update
    if@product.update(product_params)
      redirect_to admins_product_path(@product.id)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :explanation, :price, :is_active, :image,:genre_id)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
