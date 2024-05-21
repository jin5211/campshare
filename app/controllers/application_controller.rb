class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :profile_image, :name, :profile, :prefecture_id, :privacy_policy, :address, :phone_number, :contact_time_id, :contact_time_another])
  end
end
