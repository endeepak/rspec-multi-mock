require 'rubygems'
require 'spec'
require 'not_a_mock'
require 'rr'
Spec::Example::ExampleMethods.__send__ :include, RR::Extensions::InstanceMethods

require 'rspec-multi-mock'

MultiMock.frameworks = MultiMock::Adapters::Mocha, MultiMock::Adapters::RSpec, NotAMock::RspecMockFrameworkAdapter, RR::Adapters::Rspec

Spec::Runner.configure do |config|
  config.mock_with MultiMock::Adapter
  # config.mock_with :mocha
  # config.mock_with :rspec
  # config.mock_with NotAMock::RspecMockFrameworkAdapter
  # config.mock_with  RR::Adapters::Rspec
end
