require 'rubygems'

begin
  require 'mocha/api'

  begin
    require 'mocha/object'
  rescue LoadError
    # Mocha >= 0.13.0 no longer contains this file nor needs it to be loaded.
  end
rescue LoadError
  require 'mocha/standalone'
  require 'mocha/object'
end

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
