require 'rubygems'
require 'rr'

module MultiMock
  module Adapters
    class RR
      include ::RR::Adapters::Rspec
    end
  end
end

#This will add mock(Entity), stub(Entity) etc rr methods to spec methods
MultiMock::Adapter.send(:include, RR::Extensions::InstanceMethods)
