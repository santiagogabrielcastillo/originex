# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_in_params, only: [:create]
  protected

  def after_sign_up_path_for(_resource)
    if current_user.user_interests.count >=1
      activities_path
    else
      user_interests_path
    end
  end

  def after_update_path_for(_resource)
    activities_path
  end
end
