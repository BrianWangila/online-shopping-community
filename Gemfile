# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.4'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.0.4'

# Use postgresql as the database for Active Record
gem 'pg', '~> 1.4.4'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '~> 5.0'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
# gem "jbuilder"

# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'bootsnap', require: false

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
gem 'bcrypt', '~> 3.1.7'

# allows you to generate your JSON in an object-oriented and convention-driven manner.
gem 'active_model_serializers', '~> 0.10.13'

# Devise is a flexible authentication solution for Rails
gem 'devise', '~>4.8', '>=4.8.1'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
# gem "bootsnap", require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

# implementation of the RFC 7519 OAuth JSON Web Token (JWT) standard.
gem 'jwt', '~> 2.5'

# For scraping
gem 'http', '~> 5.1'
gem 'openssl', '~> 3.0', '>= 3.0.1'
gem 'uri', '~> 0.11.0'
gem "net-http"
gem 'thin'

# for pluralizing words
gem 'plural'

# for cron jobs
gem 'sidekiq-cron'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri mingw x64_mingw]

  # rspec
  gem 'rspec-rails', '~> 6.0', '>= 6.0.1'

  # should-matchers
  gem 'shoulda-matchers', '~> 5.2'

  # #for ci/cd
  # security
  gem 'brakeman'
  gem 'bundle-audit'
  gem 'ruby_audit'

  # linting
  gem 'rubocop'
  gem 'rubocop-rails'
end

group :development do
  gem 'byebug', '~> 11.1', '>= 11.1.3'

  gem 'dotenv', '~> 2.1', '>= 2.1.1'

  gem 'awesome_print', '~> 1.9', '>= 1.9.2'
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end
