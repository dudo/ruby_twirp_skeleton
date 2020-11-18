# frozen_string_literal: true

source 'https://rubygems.org'

gem 'bigdecimal', '~> 1.4' # https://github.com/hanami/model/issues/570
gem 'hanami'
gem 'hanami-model'
gem 'twirp', require: false
gem 'puma'

gem 'i18n'
gem 'jwt'
gem 'pg'
gem 'rack-cors'
gem 'rack-contrib'
gem 'rake'

group :test, :development do
  gem 'byebug'
  gem 'dotenv'
  gem 'faker'
  gem 'grpc-tools'
end

group :development do
  gem 'hanami-webconsole'
  gem 'rubocop'
  gem 'rubocop-performance', require: false
  gem 'shotgun', platforms: :ruby
end

group :test do
  gem 'capybara'
  gem 'rspec'
end
