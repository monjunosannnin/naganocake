class Admins::CustomersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @customers = Customer.all.page(params[:page]).per(10)
    @page_title = "会員一覧"
  end

  def show
    @customer = Customer.find(params[:id])
    @customer_name = @customer.kanji_familyname + @customer.kanji_firstname
    @page_title = @customer_name + "さんの会員詳細"
  end

  def edit
    @customer = Customer.find(params[:id])
    @customer_name = @customer.kanji_familyname + @customer.kanji_firstname
    @page_title = @customer_name + "さんの会員情報編集"
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to admins_customer_path
  end

  private 
  def customer_params
    params.require(:customer).permit(:kanji_familyname, :kanji_firstname, :kana_familyname, :kana_firstname, :email,  :telephone_number, :postal_code, :address, :is_deleted)
  end
end
