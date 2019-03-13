source 'https://rubygems.org'

gem 'rails', '~> 5.2.0'

gem 'bootstrap-sass'
gem 'coffee-rails'
gem 'config'
gem 'faker'
gem 'haml-rails'
gem 'jbuilder'
gem 'jquery-rails'
gem 'pry-rails'
gem 'rails-i18n', '~> 5.0.0'
gem 'redcarpet'
gem 'sass-rails', '~> 5.0.0'
gem 'therubyracer', platforms: :ruby
gem 'turbolinks'
gem 'simple_form'
gem 'uglifier', '>= 1.3.0'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development, :test do
  gem 'byebug'
  gem 'capybara'
  gem 'factory_girl_rails'
  gem 'railroady'
  gem 'rspec-rails'
  gem 'simplecov', require: false
  gem 'sqlite3', '~> 1.3.6'
end

group :development do
  # Use sqlite3 as the database for Active Record
  gem 'brakeman'
  # gem 'capistrano
  gem 'letter_opener'
end

# This group is used for deployment to heroku which doesn't support
# sqlite, hence this has postgres.
group :production do
  gem 'unicorn'
  gem 'pg'
  gem 'rails_12factor'
  # comment this in if you which to use sqlite in production
  # gem 'sqlite3'
end
