# Be sure to restart your server when you modify this file.
#
# Eases the Rails 7.2 framework defaults upgrade while config.load_defaults is still 6.1.
# Once everything below is enabled (or intentionally dropped), remove this file and set
# config.load_defaults to 7.2 in config/application.rb.
#
# (active_job.enqueue_after_transaction_commit was removed from here: Rails 8.1 drops the global setting.)
#
# Enabled: safe for this app (no manual date queries).
Rails.application.config.active_record.validate_migration_timestamps = true
Rails.application.config.active_record.postgresql_adapter_decode_dates = true

# Deferred on purpose:
#
# YJIT only applies on Ruby 3.3+ (the app runs 3.2) and costs memory; revisit with the Ruby upgrade.
# Rails.application.config.yjit = true
#
# Serving WebP as-is needs ImageMagick/libvips built with WebP support on every host.
# Rails.application.config.active_storage.web_image_content_types = %w[image/png image/jpeg image/gif image/webp]
