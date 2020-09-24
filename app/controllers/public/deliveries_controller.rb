class Public::DeliveriesController < ApplicationController
	def index
		@delivery = delivery.new
		@deliveries = current_customer.deliveries
	end

	def edit
	end

	def update
	end
end
