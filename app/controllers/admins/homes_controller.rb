class Admins::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    @today_orders = Order.where(created_at: Time.now.all_day)
    @page_title = "管理者画面"
  end
end
