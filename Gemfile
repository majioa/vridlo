source 'https://rubygems.org'

ruby '2.7.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.4', '>= 5.2.4.5'
# Use sqlite3 as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.1', '>= 5.1.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails', '>= 4.4.0'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.8', '>= 2.8.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 1.0.0', group: :doc

# Fix CVE-2018-8048
gem 'rails-html-sanitizer', '~> 1.0.4'

# Fix CVEs
gem 'nokogiri', '~> 1.12'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'draper', '>= 4.0.1'

gem 'slim-rails', '>= 3.2.0'

group :development, :test do
   gem 'rspec-rails', '~> 3.8', '>= 3.8.3'
   gem 'pry-rails'
   gem 'factory_bot_rails', '>= 5.2.0'
   gem 'faker'
   gem 'ffaker'
   gem 'spring', '>= 2.0.2'
   gem 'spring-commands-rspec', '>= 1.0.4'
end

group :test do
   gem 'rails-controller-testing', '>= 1.0.4'
   gem 'rspec-wait'
   gem 'shoulda-matchers', '~> 4.0.1.0'
   gem 'database_cleaner'
   gem 'capybara', '>= 3.31.0'
   gem 'capybara-webkit', '>= 1.15.1'
end

