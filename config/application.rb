require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
# require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Xodoki
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Cache entries are regenerable; 6.1 format is deprecated and removed in Rails 7.2.
    # Move to 7.1 once the 7.1 deploy is final and rollback is off the table.
    config.active_support.cache_format_version = 7.0

    # Locale settings
    config.i18n.default_locale = :ru
    config.i18n.available_locales = %i[en ru]

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.generators do |g|
      g.assets false
      g.helper false
      g.javascript_engine :js
    end
    # Don't generate system test files.
    config.generators.system_tests = nil
  end
end
