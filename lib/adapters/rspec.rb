require 'rspec/core/mocking/with_rspec'

module MultiMock
  module Adapters
    class RSpec
      include ::RSpec::Core::MockFrameworkAdapter
    end
  end
end