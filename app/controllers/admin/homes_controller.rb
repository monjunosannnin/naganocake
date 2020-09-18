class Admins::HomesController < ApplicationController
	before_action :authenticate_admin!

	 def top
	    # @today_orders = Orders.where(created_at: Time.now.all_day)
	 end

end