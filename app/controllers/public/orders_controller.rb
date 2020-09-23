class Public::OrdersController < ApplicationController

	def new
		@order = Order.new
		@customer = current_customer
		@customers = Customer.all
	end

	def confirm
		@order = Order.new
		@cart_items = current_customer.cart_items
		@order.payment_method = params[:order][:payment_method]
		@add = params[:order][:add].to_i
		case @add
			when 1
			@order.post_code = @customer.post_code
			@order.customer.deliveries.address = @customer.address
			@order.address = @customer.kanji_familyname + @customer.kanji_firstname
			when 2
			@sta = params[:order][:address].to_i
			@delivery = Delivery.find(@sta)
			@order.post_code = @delivery.post_code
			@order.customer.deliveries.address = @delivery .address
			@order.address = @delivery .address
			when 3
			@order.postal_code = params[:order][:new_address][:postal_code]
			@order.customer.deliveries.address = params[:order][:new_address][:address]
			@order.address = params[:order][:new_address][:address]
		end
	end

	def complete
	end

	def create
	end

	def index
	end

	def show
	end

end
