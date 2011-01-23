require 'rubygems'
require 'mocha/object'
require 'mocha/api'

module MultiMock
  module Adapters
    class Mocha
      include ::Mocha::API

      alias :setup_mocks_for_rspec :mocha_setup
      alias :verify_mocks_for_rspec :mocha_verify
      alias :teardown_mocks_for_rspec :mocha_teardown
    end
  end
end