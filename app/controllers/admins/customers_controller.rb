class Admins::CustomersController < ApplicationController
  def index
    @customers = Customer.all.page(params[:page]).per(1)
  end

  def show
    
  end

  def edit
    
  end

  def update
    
  end

  private 
  def customer_params
    params.require(:customer).parmit(:kanji_familyname, :kanji_firstname, :kana_familyname, :kana_firstname, :email,  :telephone_number, :postal_code, :address, :is_deleted)
  end
end
