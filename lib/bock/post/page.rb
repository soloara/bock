module Bock

  module Post
   
    class Page
      
      attr_reader :posts, :total_number
      attr_accessor :number
      
      # the first arg is posts
      # the 2.nd arg is page number
      # the 3.rd arg is total pages size 
      def initialize posts, num, total_number
        @posts = posts
        @number = num
        @total_number = total_number
      end
      
      def path
        "#{number}.html"
      end
      
      def next_page_path num=1
        "#{number+num}.html" unless (number + num) > total_number
      end
      
      def previous_page_path num=1
        "#{number-num}.html" unless (number - num) < 1
      end
      
      def first_page_path
        '1.html'
      end
      
      def last_page_path
        "#{total_number}.html"
      end
      
    end
  
  end

end