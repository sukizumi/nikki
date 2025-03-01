# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  skip_before_action :verify_signed_out_user, only: :destroy

  
  def guest_sign_in
    reset_session
    user = User.guest
    sign_in user
    flash[:notice] = "ゲストとしてログインしました"
    redirect_to about_path
  end

  def destroy
    reset_session
    sign_out current_user
    flash[:notice] = "ログアウトしました"
    redirect_to about_path
  end

  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
