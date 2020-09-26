class Public::ProductsController < ApplicationController

	def index
		if params[:genre_id].present?
			@genre = Genre.find(params[:genre_id])
			@products = Product.where(genre_id: params[:genre_id]).page(params[:page]).per(8)
			@name = @genre.name
		else
			@genre = Genre.new
			@name = "商品"
			@products = Product.all.page(params[:page]).per(8)
		end
		@genres = Genre.all
	end

	def show
		@genres = Genre.all
		@product = Product.find(params[:id])
		@cart_item = CartItem.new(params[:product_id])
	end

end