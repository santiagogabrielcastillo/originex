class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up, keys: %i[username full_name phone_number birthday address photo description]
    )

    devise_parameter_sanitizer.permit(
      :account_update, keys: %i[username full_name phone_number birthday address photo description]
    )
  end
end

