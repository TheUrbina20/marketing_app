# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'administrate', git: 'https://github.com/thoughtbot/administrate.git'
gem 'administrate-field-active_storage'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'bulma-rails'
gem 'chartkick'
gem 'devise'
gem 'devise_invitable', '~> 2.0.0'
gem 'font_awesome5_rails'
gem 'google-cloud-storage', '~> 1.8', require: false
gem 'haml-rails', '~> 2.0'
gem 'i18n-debug'
gem 'indico'
gem 'jbuilder', '~> 2.7'
gem 'koala'
gem 'pg'
gem 'puma', '~> 4.3'
gem 'rails', '~> 6.0.0'
gem 'redis-rails'
gem 'resque', '~> 2.0'
gem 'resque-scheduler'
gem 'role_model'
gem 'rubyzip', '>= 1.3.0'
gem 'sass-rails', '~> 5'
gem 'scss_lint', require: false
gem 'simple_form', '>= 5.0.0'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 4.0'

group :development, :test do
  gem 'annotate'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'dotenv-rails'
  gem 'pry'
end

group :development do
  gem 'letter_opener'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rubocop', require: false
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

group :production do
  gem 'aws-sdk-s3'
  gem 'image_processing', '~> 1.2'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
