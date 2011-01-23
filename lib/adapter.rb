module MultiMock
  module Adapter
    def self.for(*frameworks)
      self.tap do
        MultiMock.frameworks = frameworks.flatten
      end
    end

    def setup_mocks_for_rspec
      MultiMock.frameworks.each(&:setup_mocks_for_rspec)
    end

    def verify_mocks_for_rspec
      MultiMock.frameworks.each(&:verify_mocks_for_rspec)
    end

    def teardown_mocks_for_rspec
      MultiMock.frameworks.each(&:teardown_mocks_for_rspec)
    end
  end
end
