class Public::CartItemsController < ApplicationController

	def create
		@cart_item = CartItem.new(cart_item_params)
		@cart_item.customer_id = current_customer.id
		@current_item = CartItem.find_by(product_id: @cart_item.product_id,customer_id: @cart_item.customer_id)
		if @current_item.nil?
		  if @cart_item.save
			flash[:success] = 'カートに商品が追加されました！'
			redirect_to cart_items_path
		  else
			@carts_items = set_customer.cart_items.all
			render 'index'
			flash[:danger] = 'カートに商品を追加できませんでした。'
		  end
		else
		  @current_item.quantity += params[:quantity].to_i
		  @current_item.update(cart_item_params)
		  redirect_to cart_items_path
		end
	end

	def update
		@cart_item = CartItem.find(params[:id])
		@cart_item.update(cart_item_params)
		redirect_to request.referer
	end

	def index
		@cart_items = CartItem.all
		@cart_item = CartItem.find(params[:id])
	end

	def destroy
	end

	def destroy_all
	end

	private

	def set_customer
		@customer = current_customer
	end
	
	def set_cart_item
		@cart_item = CartItem.find(params[:id])
	end

	def cart_item_params
		params.require(:cart_item).permit(:product_id, :customer_id, :quantity)
	end
end
