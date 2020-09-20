class Public::CustomersController < ApplicationController

  def show
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
  end

  def withdrawal
  end

  def unsubscribe
    @customer = Customer.find(params[:id])
    #is_deletedカラムにフラグを立てる(defaultはfalse)
    @customer.update(is_deleted: true)
    #ログアウトさせる
    reset_session
    flash[:notice] = "ご利用ありがとうございました。またのお越しをお待ちしております。"
    redirect_to root_path
  end

end
