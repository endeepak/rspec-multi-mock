class Symbol
  def to_proc
    lambda { |a| a.send(self) }
  end
end

module MultiMock
  def self.frameworks=(*frameworks)
    @frameworks = frameworks.flatten.collect { |f| Object.new.tap { |o| o.send(:extend, f) } }
  end

  def self.frameworks
    @frameworks ||= []
  end
end

module  MultiMockAdapter
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
