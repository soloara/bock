require 'bock/post/page'

module Bock 

  module Post

    class Collection

      attr_reader :posts

      def initialize dir, parser
        @dir = dir
        @parser = parser
        get_posts
      end
      
      def pagenate per_page=0
        per_page = @posts.size if per_page.zero?
        pages_num = (@posts.size > (@posts.size / per_page) * per_page) ? ((@posts.size / per_page) + 1) : (@posts.size / per_page)
        pages = []
        pages_num.times do |index|
          start_at = index * per_page
          pages << Bock::Post::Page.new(@posts[start_at, per_page], (index + 1), pages_num)
        end
        pages
      end

      private

      def get_posts
        @posts = []
        Dir.foreach(@dir) do |file_name|
          unless file_name =~ /^\.+$/
            file_full_name = File.join(@dir, file_name)
            result = @parser.result(file_name)
            @posts << result if result
          end
        end
      end


    end

  end

end
