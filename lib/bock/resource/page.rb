module Bock

  module Resource
   
    class Page
      
      attr_reader :resources, :number, :total_number
      
      def initialize resources, num, total_number
        @resources = resources
        @number = num
        @total_number = total_number
      end
      
    end
  
  end

end