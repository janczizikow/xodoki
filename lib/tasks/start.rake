# frozen_string_literal: true

namespace :start do
  desc 'Start server in development mode'
  task development: :environment do
    exec 'foreman start -f Procfile.dev'
  end

  desc 'Start server in production mode'
  task production: :environment do
    exec 'NPM_CONFIG_PRODUCTION=true npm run postinstall && foreman start'
  end
end
task start: 'start:development'
