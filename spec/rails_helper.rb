require 'simple cov'
SimpleCov.start
# spec/rails_helper.rb
require 'spec_helper'
require 'rspec/rails'
require 'swagger_helper'

# Configuration for RSpec
RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # if you 're not using ActiveRecord, you can remove this line
  config.use_transactional_fixtures = true

  # Configuration for the RSpec API
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end