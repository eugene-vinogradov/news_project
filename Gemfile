# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

gem 'jbuilder', '~> 2.7'
gem 'puma', '~> 4.1'
gem 'rails', '~> 6.0.3', '>= 6.0.3.3'
gem 'sass-rails', '>= 6'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 4.0'
# gem 'redis', '~> 4.0'
gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'bootstrap-sass', '3.4.1'
gem 'faker', '~> 2.14'
gem 'image_processing', '~> 1.2'
gem 'open_uri_redirections', '~> 0.2.1'
gem 'rake', '~> 13.0', '>= 13.0.1'
gem 'rexml', '~> 3.2', '>= 3.2.4'
gem 'simple-rss', '~> 1.3', '>= 1.3.3'
gem 'whenever', '~> 1.0'
gem 'will_paginate', '~> 3.3'
gem 'will_paginate-bootstrap', '~> 1.0', '>= 1.0.2'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'sqlite3', '~> 1.4'
end

group :development do
  gem 'listen', '~> 3.2'
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
  gem 'pg', '~> 1.2', '>= 1.2.3'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
