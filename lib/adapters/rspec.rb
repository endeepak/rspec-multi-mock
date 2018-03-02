require 'rspec/core/mocking_adapters/rspec'

module MultiMock
  module Adapters
    class RSpec
      include ::RSpec::Core::MockingAdapters::RSpec
    end
  end
end

MultiMock::Adapter.send(:include, ::RSpec::Mocks::ExampleMethods)
