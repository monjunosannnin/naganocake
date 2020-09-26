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
		@total_price = 0
		@order.payment_method = params[:order][:payment_method].to_i
		@add = params[:order][:add].to_i
		case @add
			when 1
			@order.postal_code = @customer.postal_code
			@order.address = @customer.address
			@order.name = @customer.kanji_familyname + @customer.kanji_firstname
			when 2
			@sta = params[:order][:address].to_i
			@delivery = Delivery.find(@sta)
			@order.postal_code = @delivery.postal_code
			@order.address = @delivery.address
			when 3
			@order.postal_code = params[:order][:new_address][:postal_code]
			@order.address = params[:order][:new_address][:address]
			@order.name = params[:order][:new_address][:name]
		end
	end

	def create
		if current_customer.cart_items.exists?
			@order = Order.new(order_params)
			@order.customer_id = current_customer.id
			@customer = current_customer
			@add = params[:order][:add].to_i
			case @add
			  when 1
				@order.postal_code = @customer.postal_code
				@order.address = @customer.address
				@order.name = @customer.kanji_familyname + @customer.kanji_firstname
			  when 2
				@order.postal_code = params[:order][:postal_code]
				@order.address = params[:order][:address]
				@order.name = params[:order][:name]
			  when 3
				@order.postal_code = params[:order][:postal_code]
				@order.address = params[:order][:address]
				@order.name = params[:order][:name]
			end
			@order.save
			if Delivery.find_by(address: @order.address).nil?
			  @delivery = Delivery.new
			  @delivery.postal_code = @order.postal_code
			  @delivery.address = @order.address
			  @delivery.name = @order.name
			  @delivery.customer_id = current_customer.id
			  @delivery.save
			end
			@customer.cart_items.each do |cart_item|
			  ordered_product = @order.ordered_products.build
			  ordered_product.order_id = @order.id
			  ordered_product.product_id = cart_item.product_id
			  ordered_product.quantity = cart_item.quantity
			  ordered_product.price = cart_item.product.price 
			  ordered_product.save
			  cart_item.destroy 
			end
	  
			redirect_to thanks_path
		else
			redirect_to products_path, danger: 'カートが空です。'
		end
	end

	def index
		@orders = current_customer.orders
		@total_price = 0
	end

	def show
		@order = Order.find(params[:id])
		@total_price = 0
		if @order.customer_id != current_customer.id
		  redirect_back(fallback_location: root_path)
		  flash[:alert] = "アクセスに失敗しました。"
		end
	end

	private

	def order_params
	params.require(:order).permit(
		:address, :name, :order_status, :payment_method, :postal_code, :shipping_cost,
		ordered_products_attributes: [:order_id, :product_id, :quantity, :price, :status]
      )
	end	

end
