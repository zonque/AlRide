source 'https://rubygems.org'

gem 'rails', '~> 4.2.0'

gem 'bootstrap-sass', '~> 3.3.6'
gem 'coffee-rails'
gem 'dotenv'
gem 'haml-rails'
gem 'jbuilder', '~> 2.0'
gem 'jquery-rails'
gem 'pry-rails'
gem 'rails-i18n', '~> 4.0.0'
gem 'redcarpet'
gem 'sass-rails', '~> 5.0.0'
gem 'therubyracer'
gem 'therubyracer', platforms: :ruby
gem 'turbolinks'
gem 'uglifier', '>= 1.3.0'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development do
  # Use sqlite3 as the database for Active Record
  gem 'brakeman'
  # gem 'capistrano
  gem 'faker'
  gem 'letter_opener'
  gem 'sqlite3'
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
