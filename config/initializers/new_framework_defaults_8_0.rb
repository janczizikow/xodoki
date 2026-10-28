# Be sure to restart your server when you modify this file.
#
# Eases the Rails 8.0 framework defaults upgrade while config.load_defaults is still 6.1.
# Once everything below is enabled (or intentionally dropped), remove this file and set
# config.load_defaults to 8.0 in config/application.rb.
#
# Enabled: safe for this app.

# Honor only If-None-Match when a client sends both it and If-Modified-Since (RFC 7232 section 6).
Rails.application.config.action_dispatch.strict_freshness = true

# Bound every regular expression to 1s, protecting against Regexp denial-of-service.
# (Photo#link validates user input with a backtracking-prone pattern; it now raises instead of hanging.)
Regexp.timeout = 1
