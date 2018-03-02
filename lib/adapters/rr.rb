require 'rubygems'
require 'rr'

module MultiMock
  module Adapters
    class RR
      include ::RR::Extensions::InstanceMethods

      alias :setup_mocks_for_rspec :reset
      alias :verify_mocks_for_rspec :verify
      alias :teardown_mocks_for_rspec :reset
    end
  end
end

#This will add mock(Entity), stub(Entity) etc rr methods to spec methods
MultiMock::Adapter.send(:include, ::RR::Extensions::InstanceMethods)
