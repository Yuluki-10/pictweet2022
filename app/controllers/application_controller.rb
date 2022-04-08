class ApplicationController < ActionController::Base
  before_action :configure_permitted_pamameters, if: :devise_controller?
  def configure_permitted_pamameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end
end
