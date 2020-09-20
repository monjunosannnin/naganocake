class Admins::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @orders = Order.all.page(params[:page]).per(10)
    @page_title = "注文履歴一覧"
    quantity_total = Array.new
    i = 0

    @orders.each do |o|
      @order_products = o.order_products
      quantity = 0
      quantity_total = 0

      @order_products.each do |op|
        quantity = @quantity + @order_products.quantity
      end

      quantity_total[i] = quantity
      i += 1
    end

    @quantity_total = 
  end

  def show
    
  end

  def update
    
  end

  private 
  def order_params
    params.require(:order).permit(:status)
  end
end
