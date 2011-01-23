module MultiMock
  module Extensions
    module Symbol
      def to_proc
        lambda { |a| a.send(self) }
      end
    end
  end
end

Symbol.send(:include, MultiMock::Extensions::Symbol)