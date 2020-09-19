class Admins::CustomersController < ApplicationController
  def index
    @customers = Customer.all.page(params[:page]).per(1)
  end

  def show
    @customer = Customer.find(params[:id])
    @customer_name = @customer.kanji_familyname + @customer.kanji_firstname
  end

  def edit
    @customer = Customer.find(params[:id])
    @customer_name = @customer.kanji_familyname + @customer.kanji_firstname
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
