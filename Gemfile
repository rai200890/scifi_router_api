# frozen_string_literal: true
ruby '2.3.1'

source 'https://rubygems.org'

gem 'dotenv', groups: [:development, :test]
gem 'dotenv-rails', require: 'dotenv/rails-now'
gem 'rake'
gem 'rails'
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
  gem 'mysql2'
  gem 'rubocop'
end

group :production do
  gem 'rails_12factor'
  gem 'pg'
end
