require 'rubygems'

# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)

# Require the spec integration
require 'rspec/rails'
require 'rspec/autorun'

require 'capybara/rails'
require 'capybara/rspec'

require 'shoulda/matchers/integrations/rspec'

# Enable this gem if testing of e-mails is required
#require "email_spec" # gem 'email_spec'

# Load the seeds
require "#{Rails.root}/db/seeds.rb"

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|

  # Configure Capybara
  Capybara.default_host = "http://127.0.0.1"
  Capybara.javascript_driver = :webkit

  # ## Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr
  config.mock_with :rspec


  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # This allows you to tag an exaple with :focus to make it run with Guard
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.filter_run :focus => true
  config.run_all_when_everything_filtered = true

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = true

  config.use_transactional_fixtures = false
  static_info_tables = %w[] # Configure stable data tables (categories, countries, stuff like that here)

  config.before(:each) do
    if example.metadata[:js]
      DatabaseCleaner.strategy = :truncation, {except: static_info_tables}
    else
      DatabaseCleaner.strategy = :transaction
    end
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
  # **** database configuration end ****

  # Factory girl direct methods
  config.include FactoryGirl::Syntax::Methods

  # Include devise test helpers in controller specs
  config.include Devise::TestHelpers, :type => :controller


  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = 'random'
end
