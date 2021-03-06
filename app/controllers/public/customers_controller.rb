class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
    @customer = Customer.find(current_customer.id)
    @page_title = "マイページ"
  end

  def edit
    @customer = Customer.find(current_customer.id)
    @page_title = "登録情報編集"
  end

  def update
    @customer = Customer.find(current_customer.id)
    if @customer.update(customer_params)
       redirect_to mypage_path
    else
       redirect_to edit_customers_path
       @page_title = "登録情報編集"
    end
  end

  def withdrawal
  end

  def unsubscribe
    @customer = Customer.find(current_customer.id)
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  private
    def customer_params
      params.require(:customer).permit(:kanji_familyname, :kanji_firstname, :kana_familyname, :kana_firstname, :postal_code, :address, :telephone_number, :email, :is_deleted)
    end
  end
