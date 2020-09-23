class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
    @customer = Customer.find(current_customer.id)
  end

  def edit
    @customer = Customer.find(current_customer.id)
  end

  def update
    @customer = Customer.find(current_customer.id)
    if @customer.update(customer_params)
       flash[:notice] = 'It was successfully updated.'
       redirect_to mypage_path
    else
       render :edit
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
