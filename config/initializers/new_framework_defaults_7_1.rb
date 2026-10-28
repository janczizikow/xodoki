# Be sure to restart your server when you modify this file.
#
# Eases the Rails 7.1 framework defaults upgrade while config.load_defaults is still 6.1.
# Once everything below is enabled (or intentionally dropped), remove this file and set
# config.load_defaults to 7.1 in config/application.rb.
#
# Enabled: safe for this app (no serialize, attr_readonly, Active Record encryption,
# transaction/return, has_secure_token or custom commit callbacks in use).
Rails.application.config.action_controller.allow_deprecated_parameters_hash_equality = false
Rails.application.config.active_record.run_commit_callbacks_on_first_saved_instances_in_transaction = false
Rails.application.config.active_record.allow_deprecated_singular_associations_name = false
Rails.application.config.active_support.raise_on_invalid_cache_expiration_time = true
Rails.application.config.active_record.raise_on_assign_to_attr_readonly = true
Rails.application.config.active_record.belongs_to_required_validates_foreign_key = false
Rails.application.config.precompile_filter_parameters = true
Rails.application.config.active_record.before_committed_on_all_records = true
Rails.application.config.active_record.run_after_transaction_callbacks_in_order_defined = true
Rails.application.config.active_record.commit_transaction_on_non_local_return = true
Rails.application.config.active_record.generate_secure_token_on = :initialize
Rails.application.config.active_record.default_column_serializer = nil
Rails.application.config.action_dispatch.debug_exception_log_level = :error
Rails.application.config.dom_testing_default_html_version = :html5

# Deferred on purpose:
#
# These change serialized formats, so older servers cannot read what upgraded servers write.
# Enable in a follow-up deploy, after every server runs Rails 7.1:
# Rails.application.config.active_support.message_serializer = :json_allow_marshal
# Rails.application.config.active_support.use_message_serializer_for_metadata = true
# Rails.application.config.active_record.marshalling_format_version = 7.1
# Rails.application.config.active_job.use_big_decimal_serializer = true
# and in config/application.rb: config.active_support.cache_format_version = 7.1
#
# HTML5 sanitizers can change how rich text (Page#content) is sanitized and rendered.
# Enable together with a manual check of the pages that render rich text:
# Rails.application.config.action_view.sanitizer_vendor = Rails::HTML::Sanitizer.best_supported_vendor
# Rails.application.config.action_text.sanitizer_vendor = Rails::HTML::Sanitizer.best_supported_vendor
#
# Not used by this app (Active Record encryption, SQLite, query log tags, log file size):
# Rails.application.config.active_record.encryption.support_sha1_for_non_deterministic_encryption = false
# Rails.application.config.active_record.sqlite3_adapter_strict_strings_by_default = true
# Rails.application.config.active_record.query_log_tags_format = :sqlcommenter
