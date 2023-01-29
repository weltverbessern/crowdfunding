source 'https://rubygems.org'

ruby '~> 3.1.0'

gem 'rails'
gem 'thin'
gem 'json'
gem 'config'

group :development do
  gem 'sqlite3'
  gem 'pry-rails'
end

group :production do
  gem 'pg'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'uglifier'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'shoulda'
end

# Bootstrap
gem 'bootstrap', '~> 5.2.0'

# jQuery
gem 'jquery-rails'
gem 'jquery-ui-rails'

# Countries for select box
gem 'countries'

# Payment
gem 'activemerchant'
gem 'rexml'

# Configuration File
gem 'rails_config'

# i18n
gem 'rails-i18n'
gem 'i18n-active_record', require: 'i18n/active_record'

# Administration interface
gem 'trestle'
gem 'trestle-auth'
gem 'trestle-search'
gem 'trestle-active_storage', git: 'https://github.com/richardvenneman/trestle-active_storage.git', ref: '5a9c90e3d71c8cf6b40444292d7e77f3137c589b'

# Image processing
gem 'image_processing', '~> 1.2'

# For Heroku
gem 'rails_12factor'
