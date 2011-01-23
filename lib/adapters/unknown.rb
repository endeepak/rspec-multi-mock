module MultiMock
  module Adapters
    class Unknown
      def initialize(adapter_module)
        self.extend(adapter_module)
      end
    end
  end
end