require 'webmock/rspec'
require_relative './support/fake_api'
require_relative './support/fake_learn'

WebMock.disable_net_connect!(allow_localhost: true)


RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.before(:each) do
    stub_request(:any, /learn.co/).to_rack(FakeLearn.new)
  end
end
