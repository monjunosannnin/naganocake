class Public::ProductsController < ApplicationController

	def index
		if params[:genre_id].present?
			@genre = Genre.where(params[:genre_id])
			@products = Product.where(genre_id: params[:genre_id])
			@name = @genre.name
		else 
			@genre = Genre.new
			@name = "商品"
			@products = Product.all
		end
	end

	def show
	end

end
