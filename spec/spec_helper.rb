require 'rubygems'
require 'spec'
require 'mocha'
require 'not_a_mock'
require 'rr'
Spec::Example::ExampleMethods.__send__ :include, RR::Extensions::InstanceMethods

Dir["#{File.expand_path(File.dirname(__FILE__) + '/../lib/*.rb')}"].each { |file|  require file }

MultiMock.frameworks = MochaAdapter, RSpecAdapter, NotAMock::RspecMockFrameworkAdapter, RR::Adapters::Rspec

Spec::Runner.configure do |config|
  config.mock_with MultiMockAdapter
  # config.mock_with :mocha
  # config.mock_with :rspec
  # config.mock_with NotAMock::RspecMockFrameworkAdapter
  # config.mock_with  RR::Adapters::Rspec
end
