class Public::ProductsController < ApplicationController

	def index
		@product = Product.new
		@products = Product.all
	end

	def show
	end

end
