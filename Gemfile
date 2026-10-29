source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.4.7'

gem 'observer'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 8.1.0'
# Use postgresql as the database for Active Record
gem 'pg'
# Use Puma as the app server
gem "puma", ">= 5.0"
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Bundle JavaScript with esbuild (see esbuild.config.js). Read more: https://github.com/rails/jsbundling-rails
gem 'jsbundling-rails'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.7'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

gem 'rails-i18n', '~> 8.0'
gem 'devise-i18n'


gem 'aws-sdk-s3', require: false
gem 'fog-aws'
gem 'administrate', '~> 1.0'
gem 'autoprefixer-rails'
gem 'babosa'
gem 'carrierwave', '~> 3.1'
gem 'carrierwave-i18n'
gem 'css-class-string'
gem 'mini_magick'
gem 'devise', '~> 4.9'
gem 'friendly_id', '~> 5.4'
gem 'font-awesome-sass', '~> 5.2'
gem 'pagy', '~> 3.5'
gem 'pg_search'
gem 'pundit'
gem 'simple_form'
gem 'slim-rails'
gem 'sentry-ruby'
gem 'sentry-rails'

group :development, :test do
  gem 'capybara', '>= 3.26'
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'guard-rspec'
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'rspec-rails', '~> 7.0'
end

group :development do
  gem 'web-console', '>= 4.1.0'
  gem 'rack-mini-profiler', '>= 3.3'
  gem 'listen', '~> 3.3'
  gem 'rails_real_favicon'
  gem 'letter_opener'
  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false
end

group :test do
  gem 'guard'
  gem 'rails-controller-testing'
  gem 'shoulda-matchers', '~> 4.0'
  gem 'pundit-matchers', '~> 1.7.0'
  gem 'simplecov', require: false
end

gem 'tzinfo-data', platforms: %i[ windows jruby ]