require 'rubygems'
require 'rr'

module MultiMock
  module Adapters
    class RR
      include ::RR::Adapters::Rspec
    end
  end
end

Spec::Example::ExampleMethods.send(:include, RR::Extensions::InstanceMethods)
