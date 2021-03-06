class Public::DeliveriesController < ApplicationController
	
	before_action :authenticate_customer!
	before_action :set_customer

	def index
		@delivery = Delivery.new
		@customer = current_customer
		@deliveries = @customer.deliveries
	end

	def create
		@delivery = Delivery.new(delivery_params)
		@delivery.customer_id = current_customer.id
		if @delivery.save
		  redirect_to deliveries_path
		else
			@deliveries = current_customer.deliveries
			render :index
		end
	end

	def edit
		@delivery = Delivery.find(params[:id])
		if @delivery.customer_id != current_customer.id
			redirect_back(fallback_location: root_path)
		end

	end

	def update
		@delivery = Delivery.find(params[:id])
		if @delivery.update(delivery_params)
			redirect_to deliveries_path
		else
			render :end
		end
	end

	def destroy
		@delivery = Delivery.find(params[:id])
		@delivery.destroy
		redirect_to deliveries_path
	end

	private

	def set_customer
		@customer = current_customer
	end

	def delivery_params
		params.require(:delivery).permit(:postal_code, :address, :name)
	end
end
