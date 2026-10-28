# Be sure to restart your server when you modify this file.
#
# Eases the Rails 7.0 framework defaults upgrade while config.load_defaults is still 6.1.
# Once everything below is enabled (or intentionally dropped), remove this file and set
# config.load_defaults to 7.0 in config/application.rb.
#
# Enabled: safe for this app (no button_to, to_s(:format), or Active Storage variants in use).
Rails.application.config.action_view.button_to_generates_button_tag = true
Rails.application.config.action_view.apply_stylesheet_media_default = false
Rails.application.config.active_support.remove_deprecated_time_with_zone_name = true
Rails.application.config.active_support.executor_around_test_case = true
Rails.application.config.active_support.use_rfc4122_namespaced_uuids = true
Rails.application.config.action_mailer.smtp_timeout = 5
Rails.application.config.active_record.automatic_scope_inversing = true
Rails.application.config.active_record.partial_inserts = false
Rails.application.config.action_dispatch.default_headers = {
  'X-Frame-Options' => 'SAMEORIGIN',
  'X-XSS-Protection' => '0',
  'X-Content-Type-Options' => 'nosniff',
  'X-Permitted-Cross-Domain-Policies' => 'none',
  'Referrer-Policy' => 'strict-origin-when-cross-origin'
}

# Deferred on purpose:
#
# Changing the digest class invalidates every signed/encrypted cookie (all sessions) and
# cache keys/ETags. Only switch after setting up cookie rotation:
# https://guides.rubyonrails.org/v7.0/upgrading_ruby_on_rails.html
# Rails.application.config.active_support.key_generator_hash_digest_class = OpenSSL::Digest::SHA256
# Rails.application.config.active_support.hash_digest_class = OpenSSL::Digest::SHA256
#
# redirect_to @record builds URLs from ApplicationController#default_url_options, which
# hardcodes ENV['HOST'] || 'localhost:3000'. With this flag every redirect to a host other
# than the request host raises UnsafeRedirectError. Enable after dropping that hardcoded host.
# Rails.application.config.action_controller.raise_on_open_redirects = true
#
# New cache entry format is unreadable by Rails 6.1; set in config/application.rb once
# the 7.0 deploy is final and rollback is off the table:
#   config.active_support.cache_format_version = 7.0
#
# The vips variant processor needs ruby-vips; the app does not use Active Storage variants.
# Rails.application.config.active_storage.variant_processor = :vips
# Rails.application.config.active_storage.video_preview_arguments = ...
