require 'adapters/unknown'

module MultiMock
  def self.frameworks=(frameworks)
    @frameworks = frameworks.collect { |f|  framework(f) }
  end

  def self.frameworks
    @frameworks ||= []
  end

  private
  def self.framework(framework)
    case framework
    when Symbol, String
      adapter(framework.to_s).new
    when Module
      MultiMock::Adapters::Unknown.new(framework)
    end
  end

  def self.adapter(framework)
    case framework
    when /rspec/
      require 'adapters/rspec'
      MultiMock::Adapters::RSpec
    when /mocha/
      require 'adapters/mocha'
      MultiMock::Adapters::Mocha
    when /rr/
      require 'adapters/rr'
      MultiMock::Adapters::RR
    end
  end
end