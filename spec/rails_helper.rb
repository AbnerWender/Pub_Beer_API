# frozen_string_literal: true

require 'simplecov'
require 'rswag/specs/rails'

SimpleCov.start
# spec/rails_helper.rb
require 'spec_helper'
require 'rspec/rails'
require 'swagger_helper'

# Configuration for RSpec
RSpec.configure do |config|
  config.fixture_path = Rails.root.join('spec/fixtures').to_s

  # if you 're not using ActiveRecord, you can remove this line
  config.use_transactional_fixtures = true

  # Configuration for the RSpec API
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end

RSpec.configure do |config|
  config.after(:suite) do
    RSpec::OpenAPI.generate
  end
end
