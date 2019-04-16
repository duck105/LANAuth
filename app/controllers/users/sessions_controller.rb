# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    super
    ip = request.ip
    record=current_user.records.find_by_source_ip(ip)
    if record.nil?
      current_user.records.create(source_ip: ip)
    end
  end

  # DELETE /resource/sign_out
  def destroy
    ip = request.ip
    record=current_user.records.find_by_source_ip(ip)
    if record&.exist?
      record.destroy
    end
    super
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
