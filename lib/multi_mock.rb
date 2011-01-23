module MultiMock
  def self.frameworks=(*frameworks)
    @frameworks = frameworks.flatten.collect { |f| Object.new.tap { |o| o.send(:extend, f) } }
  end

  def self.frameworks
    @frameworks ||= []
  end
end