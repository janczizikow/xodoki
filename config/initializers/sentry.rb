Sentry.init do |config|
  # Without a DSN the SDK stays disabled
  config.dsn = ENV['SENTRY_DSN']
  config.breadcrumbs_logger = %i[active_support_logger http_logger]
end
