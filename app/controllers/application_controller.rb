# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit
  include Pagy::Backend
  protect_from_forgery with: :exception

  before_action :authenticate_user!, unless: %i[devise_controller?]
  before_action :set_raven_context
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

  def set_raven_context
    Raven.user_context(id: current_user&.id)
    Raven.extra_context(params: params.to_unsafe_h, url: request.url)
  end
end
