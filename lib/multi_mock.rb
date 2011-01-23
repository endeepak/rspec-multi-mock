module MultiMock
  FRAMEWORK_MAP = { :rspec => MultiMock::Adapters::RSpec,
                    :mocha =>  MultiMock::Adapters::Mocha,
                    :not_a_mock =>  MultiMock::Adapters::NotAMock,
                    :rr =>  MultiMock::Adapters::RR }.freeze

  def self.frameworks=(frameworks)
    @frameworks = frameworks.collect { |f|  framework(f) }
  end

  def self.framework(framework)
    case framework
    when Symbol, String
      FRAMEWORK_MAP[framework.to_sym].new
    when Module
      MultiMock::Adapters::Unknown.new(framework)
    end
  end

  def self.frameworks
    @frameworks ||= []
  end
end