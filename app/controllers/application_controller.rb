class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :full_name, :phone_number, :birthday, :address, :photo])

    devise_parameter_sanitizer.permit(:account_edit, keys: [:username, :full_name, :phone_number, :birthday, :address, :photo])
  end

  
end
