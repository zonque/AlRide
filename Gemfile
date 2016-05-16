source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 4.2.0'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

gem 'jquery-rails'

gem 'rails-i18n', '~> 4.0.0'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

gem "therubyracer"
gem 'bootstrap-sass', '~> 3.3.6'
gem 'haml-rails'
gem 'dotenv'
gem 'redcarpet'
gem 'pry-rails'

group :development do
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'
  gem 'brakeman'
  gem 'letter_opener'
  gem 'faker'
end

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

# This group is used for deployment to heroku which doesn't support
# sqlite, hence this has postgres.
group :production do
  gem 'unicorn'
  gem 'pg'
  gem 'rails_12factor'
  # comment this in if you which to use sqlite in production
  # gem 'sqlite3'
end
