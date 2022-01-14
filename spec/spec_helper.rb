# Configure Rails Envinronment
ENV["RAILS_ENV"] = "test"

require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require "rspec/rails"

ActionMailer::Base.delivery_method = :test
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.default_url_options[:host] = "test.com"

Rails.backtrace_cleaner.remove_silencers!

# Run any available migration
if ActiveRecord.version < Gem::Version.create("5.2.0")
  ActiveRecord::Migrator.migrate File.expand_path("../dummy/db/migrate/", __FILE__)
elsif ActiveRecord.version < Gem::Version.create("6.0.0")
  ActiveRecord::MigrationContext.new File.expand_path("../dummy/db/migrate/", __FILE__)
else
  ActiveRecord::MigrationContext.new(File.expand_path("../dummy/db/migrate/", __FILE__), ActiveRecord::SchemaMigration).migrate
end

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  # Remove this line if you don't want Rspec's should and should_not
  # methods or matchers
  require 'rspec/expectations'
  config.include RSpec::Matchers

  # == Mock Framework
  config.mock_with :rspec
end
