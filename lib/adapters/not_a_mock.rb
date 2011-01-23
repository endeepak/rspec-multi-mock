require 'rubygems'
require 'not_a_mock'

module MultiMock
  module Adapters
    class NotAMock
      include ::NotAMock::RspecMockFrameworkAdapter
    end
  end
end