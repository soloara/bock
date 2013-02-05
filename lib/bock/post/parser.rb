module Bock
  module Post
    class Parser
      
      def initialize strategies={}
        @strategy_map = strategies
      end
      
      def result file_name
        sub_name = File.extname file_name
        file = File.open(file_name, 'r')
        klass = @strategy_map[sub_name]
        return unless klass
        klass.new file.read
      end
      
    end
  end
end