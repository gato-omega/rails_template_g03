source 'https://rubygems.org'

gem 'rails', '3.2.15'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

gem 'cancan'
gem 'devise'

#### Gems that we might need later on do
#gem 'carrierwave'
#gem "active_attr"
#### end

gem 'haml'
gem 'simple_form'
gem 'thin'
gem 'bootstrap-sass', '~> 3.0.1.0.rc' # must specify version

group :development, :staging do
  gem 'hirb'
  gem 'wirble'
  gem 'wirb'
  gem 'haml-rails'
  gem 'quiet_assets'
end

group :test do
  gem "rspec-rails"
  gem "capybara"
  gem 'capybara-webkit'
  gem 'shoulda-matchers'
  gem 'database_cleaner'
  gem 'spork-rails'
end

# Both test and development
gem "awesome_print", :group => [:development, :test, :staging]
gem 'factory_girl_rails', :group => [:development, :test, :staging]
gem 'faker', :group => [:development, :test, :staging]

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
gem 'capistrano'

# To use debugger
# gem 'debugger'

group :production do
  gem 'mysql2' # If using mysql in development, this can be outside the production group.
  gem 'therubyracer'
end
