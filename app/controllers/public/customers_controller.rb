class Public::CustomersController < ApplicationController
  # before_action :authenticate_customer!

  def show
    @customer = Customer.find(customer_params)
  end

  def edit
    @customer = Customer.find(customer_params)
  end

  def update
    if @customer.update(customer_params)
       flash[:notice] = 'It was successfully updated.'
       redirect_to mypege_path
    else
       render :edit
       @customer = Customer.find(customer_params)
  end
  end

  def withdrawal
  end

  def unsubscribe
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "ご利用ありがとうございました。またのお越しをお待ちしております。"
    redirect_to root_path
  end

  private
    def customer_params
      params.require(:customer).permit(:kanji_familyname, :kanji_firstname, :kana_familyname, :kana_firstname, :email, :postal_code, :address, :telephone_number, :is_deleted)
    end
  end
