require 'rubygems'
require 'rspec'
require 'rspec-multi-mock'

RSpec.configure do |config|
  config.mock_with MultiMock::Adapter.for(:rspec, :mocha, :rr)
  # config.mock_with :mocha
  # config.mock_with :rspec
  # config.mock_with :rr
end
