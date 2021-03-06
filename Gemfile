# frozen_string_literal: true

source 'https://rubygems.org'

gem 'dotenv-rails', require: 'dotenv/rails-now'
gem 'rake'
gem 'jwt'
gem 'rails', '~> 5.0.0.1'
gem 'roo'
gem 'thor-rails'
gem 'responders'
gem 'puma'
gem 'railroady'
gem 'sdoc', group: :doc
gem 'rack-cors'
gem 'active_model_serializers', '~> 0.10.2'
gem 'rmagick', require: false
gem 'carrierwave'
gem 'carrierwave-dropbox'
gem 'kaminari'
gem 'has_scope'
gem 'fastimage'
gem 'httparty'
gem 'bcrypt', '~> 3.1.7'
gem 'mysql2'
gem 'pg'

group :test do
  gem 'shoulda-matchers', '~> 3.0'
  gem 'factory_girl_rails'
  gem 'codeclimate-test-reporter', require: false
  gem 'simplecov', require: false
end

group :development, :test do
  gem 'awesome_print'
  gem 'byebug'
  gem 'spring'
  gem 'rspec-rails'
  gem 'rubocop'
end

group :production do
  gem 'rails_12factor'
end
