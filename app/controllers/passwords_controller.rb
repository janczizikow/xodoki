# frozen_string_literal: true

class PasswordsController < Devise::PasswordsController
  protect_from_forgery with: :null_session
  respond_to :json

  protected

  def after_sending_reset_password_instructions_path_for(resource_name)
    'http://localhost:3000/reset-password'
  end
end
