class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope == :customer
      root_path
    elsif resource_or_scope == :admin
      admins_root_path
    end
  end


  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :customer
      new_customer_session_path
    elsif resource_or_scope == :admin
      admin_session_path
    end
  end

before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    # サインアップ時にnameのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:sign_up, keys: [:kanji_familyname, :kanji_firstname, :kana_familyname, :kana_firstname, :email, :postal_code, :address, :telephone_number])
    # アカウント編集の時にnameとprofileのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:account_update, keys: [:kanji_familyname, :kanji_firstname, :kana_familyname, :kana_firstname, :email, :postal_code, :address, :telephone_number, :is_deleted])
  end

end
