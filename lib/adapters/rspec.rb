require 'spec/adapters/mock_frameworks/rspec'

module MultiMock
  module Adapters
    class RSpec
      include ::Spec::Adapters::MockFramework
    end
  end
end