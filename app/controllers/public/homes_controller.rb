class Public::HomesController < ApplicationController

  def top
    @products = Product.all
    @random = Product.order("RANDOM()").limit(4)
    if params[:genre_id].present?
			@genre = Genre.find(params[:genre_id])
			@products = Product.where(genre_id: params[:genre_id])
			@name = @genre.name
		else
			@genre = Genre.new
			@name = "商品"
			@products = Product.all
		end
		@genres = Genre.all
  end

  def about
  end

  def thanks
  end

  def product_params
    params.require(:product).permit(:name, :price, :image)
  end

end