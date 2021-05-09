# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.6'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.3'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Utils
gem 'httparty'
gem 'rails-i18n', '~> 6.0.0'
gem 'seedbank'
gem 'simple_form'
gem 'ransack'
gem 'draper'

# Active Record
gem 'active_hash'
gem 'activerecord-import', '~> 1.0', '>= 1.0.6'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to
  # stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]

  gem 'brakeman', require: false
  gem 'bundler-audit', require: false
  gem 'rubocop', '~> 0.81.0', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false

  gem 'database_rewinder'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rspec', require: false
  gem 'rspec-rails', require: false
  gem 'shoulda', require: false
  gem 'shoulda-matchers', require: false
  gem 'simplecov', require: false

  gem 'bankai'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Access an interactive console on exception pages or
  # by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in
  # the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem 'capistrano', '3.14.1'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  # gem 'capistrano-sidekiq'
  # gem 'capistrano-passenger'

  gem 'annotate', require: false
  gem 'bullet'
  gem 'dotenv-rails'
  gem 'letter_opener'
  gem 'overcommit', require: false
  gem 'pry-rails'
  gem 'rack-mini-profiler', require: false
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'oj'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
