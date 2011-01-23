require 'spec/adapters/mock_frameworks/rspec'

module MultiMock
  module Adapters
    module RSpec
      include ::Spec::Adapters::MockFramework
    end
  end
end