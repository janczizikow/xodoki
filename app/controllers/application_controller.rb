# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit::Authorization
  include Pagy::Backend
  protect_from_forgery with: :exception

  before_action :authenticate_user!, unless: %i[devise_controller?]
  before_action :set_sentry_context
  after_action :verify_authorized, except: %i[index dashboard], unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def default_url_options
    {host: ENV['HOST'] || 'localhost:3000'}
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def user_not_authorized
    flash[:error] = t('common.unauthorized')
    redirect_to(request.referer || new_user_session_path)
  end

  def set_sentry_context
    Sentry.set_user(id: current_user&.id)
    # filtered_parameters honors config.filter_parameters (the SDK does not scrub extras)
    Sentry.set_extras(params: request.filtered_parameters, url: request.url)
  end
end
