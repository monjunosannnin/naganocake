class Admins::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @orders = Order.all.page(params[:page]).per(10)
    @page_title = "注文履歴一覧"
    quantity_total = Array.new
    i = 0

    @orders.each do |o|
      @order_products = o.ordered_products
      quantity = 0

      @order_products.each do |op|
        quantity = quantity + op.quantity
      end
      
      quantity_total[i] = quantity
      i += 1
    end
    @quantity_total = quantity_total
  end

  def show
    @order = Order.find(params[:id])
    @ordered_products = @order.ordered_products
    @customer_name = @order.customer.kanji_familyname + @order.customer.kanji_firstname
    @page_title = "注文履歴詳細"
    @total_price = 0
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_back fallback_location: admins_root_path
  end

  private 
  def order_params
    params.require(:order).permit(:status)
  end
end
