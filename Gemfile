source 'https://rubygems.org'

gem 'rails', '3.2.12'
gem 'json'
gem 'rubygems-bundler'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'coffee-rails', '~> 3.2.2'
  gem 'uglifier', '>= 1.2.3'

  gem 'therubyracer', platforms: :ruby
  gem 'less-rails-bootstrap'

  gem 'styleguides'
  gem 'font-awesome-rails'
end

gem 'jquery-rails'

gem 'devise'
gem 'simple-navigation'
gem 'simple_form'
gem 'nested_form'
gem 'decent_exposure'

gem 'kaminari'
gem 'kaminari-bootstrap'

gem 'slim'
gem 'thin'
gem 'airbrake'
gem 'gravatar_image_tag'

gem 'thumbs_up'
gem 'cocoon'
gem 'faker'

gem 'github-markdown'

group :development do
  gem 'quiet_assets'
  gem 'letter_opener'
  gem 'slim-rails'
  gem 'foreman'
  gem 'bullet'
end

group :development, :test do
  #gem 'debugger'
  gem 'annotate'

  gem 'better_errors'
  gem 'binding_of_caller'

  gem 'brakeman'
  gem 'dotenv'
  gem 'factory_girl_rails'

  gem 'guard'
  gem 'guard-annotate'
  gem 'guard-bundler'
  gem 'guard-rspec'
  gem 'guard-spork'
  gem 'guard-rails'
  gem 'guard-migrate'
  gem 'guard-livereload'

  gem 'mail_safe'
  gem 'rails_best_practices'
  gem 'rb-inotify'
  gem 'rspec-rails'
  gem 'spork'
  gem 'pg'
  gem 'faker'
end

group :test do
  gem 'simplecov', require: false
  gem 'webmock', require: false

  gem 'capybara'
  gem 'database_cleaner'
  gem 'email_spec'
  gem 'launchy'
  gem 'shoulda-matchers'
  gem 'turnip'
end

group :staging, :production do
  gem 'pg'
end
