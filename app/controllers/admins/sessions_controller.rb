# frozen_string_literal: true

class Admins::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /admins/sign_in
  def new
    @page_title = "管理者ログイン"
    super
  end

  # POST /admins/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  private
  def after_sign_in_path_for(resource)
    admins_root_path
  end

  def after_sign_out_path_for(resource)
    new_admin_session_path
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
