# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.3.0'

gem 'bootsnap', '>= 1.4.2', require: false
gem 'clockwork'
gem 'devise'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma'
gem 'rack-cors'
gem 'rails', '~> 7.1.2'
gem 'react-rails'
gem 'sidekiq'
gem 'sorbet-runtime'
gem 'sprockets-rails'
gem 'webpacker'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.7'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

group :development, :test do
  gem 'debug'
end

group :development do
  gem 'listen'
  gem 'railroady'
  gem 'rubocop'
  gem 'rubocop-performance'
  gem 'rubocop-rails'
  gem 'solargraph'
  gem 'sorbet'
  gem 'spring'
  gem 'spring-watcher-listen'
  gem 'tapioca', require: false
  gem 'web-console'
end

group :test do
  gem 'mocha'
  gem 'webmock'
end
