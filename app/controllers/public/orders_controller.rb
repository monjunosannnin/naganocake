class Public::OrdersController < ApplicationController

	def new
		@order = Order.new
		@customer = current_customer
		@customers = Customer.all
	end

	def confirm
		@order = Order.new
		@cart_items = current_customer.cart_items
		@customer = current_customer
		@order.payment_method = params[:order][:payment_method].to_i
		@add = params[:order][:add].to_i
		case @add
			when 1
			@order.postal_code = @customer.postal_code
			@order.address = @customer.address
			@order.address = @customer.kanji_familyname + @customer.kanji_firstname
			when 2
			@sta = params[:order][:address].to_i
			@delivery = Delivery.find(@sta)
			@order.postal_code = @delivery.postal_code
			@order.address = @delivery .address
			when 3
			@order.postal_code = params[:order][:new_address][:postal_code]
			@order.address = params[:order][:new_address][:address]
			@order.name = params[:order][:new_address][:name]
		end
		redirect_to orders_confirm_path
	end

	def complete
		@order = Order.new
		@cart_items = current_customer.cart_items
		@total_price = 0
		@customer = current_customer
		@order = Order.a
	end

	def create
	end

	def index
	end

	def show
	end

	private

	def order_params
	params.require(:order).permit(
		:order_id, :payment_method
	)
	end	

end
