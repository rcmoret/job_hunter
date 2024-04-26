# frozen_string_literal: true

require "factory_bot"
# This file is copied to spec/ when you run 'rails generate rspec:install'
require "spec_helper"
ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../config/environment", __dir__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require "rspec/rails"

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end
RSpec.configure do |config|
  config.fixture_path = Rails.root.join("spec/fixtures")
  config.include(ActiveSupport::Testing::TimeHelpers)
  # config.include(Helpers::CustomMatchers)
  config.include(FactoryBot::Syntax::Methods)
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!

  FactoryBot.definition_file_paths = %w[./spec/factories]
  FactoryBot.find_definitions
end
