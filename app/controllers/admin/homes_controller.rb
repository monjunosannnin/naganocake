class Admin::HomesController < ApplicationController
<<<<<<< HEAD
  before_action :authenticate_user!

  def top
    @today_orders = Orders.where(created_at: Time.now.all_day)
  end
=======
>>>>>>> 87243f38c3e7905010a71c6acf039414784b32d0
end
