class Admins::CustomersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @customers = Customer.all.page(params[:page]).per(10)
    page = Customer.page(params[:page]).current_page
    @page = admins_customers_path + "?page=" + page.to_s
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
