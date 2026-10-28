# Be sure to restart your server when you modify this file.
#
# Eases the Rails 8.1 framework defaults upgrade while config.load_defaults is still 6.1.
# Once everything below is enabled (or intentionally dropped), remove this file and set
# config.load_defaults to 8.1 in config/application.rb.
#
# Enabled: safe for this app (no JSON endpoints, every table has a primary key, redirects use
# absolute paths or full URLs).

# Do not HTML-escape JSON responses / U+2028 and U+2029 (valid in JS string literals since ES2019).
Rails.configuration.action_controller.escape_json_responses = false
Rails.configuration.active_support.escape_js_separators_in_json = false

# `first`/`second`/... on a relation with no order and no primary key to fall back on now raises.
Rails.configuration.active_record.raise_on_missing_required_finder_order_columns = true

# Redirects to a relative URL without a leading slash (`redirect_to "example.com"`) raise instead of
# only logging, closing a class of open-redirect bugs.
Rails.configuration.action_controller.action_on_path_relative_redirect = :raise

# Hidden inputs from form_tag/token_tag/method_tag/button_to no longer carry autocomplete="off".
Rails.configuration.action_view.remove_hidden_field_autocomplete = true

# Deferred on purpose:
#
# Only affects fragment-cache digests, and the app has no fragment caching.
# Rails.configuration.action_view.render_tracker = :ruby
