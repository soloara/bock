module Bock

  module Resource

    class Collection

      attr_reader :resources, :per_page, :total_pages, :pages

      def initialize resources, per_page=1
        @resources = resources
        @per_page = per_page
        @total_pages = count_total_pages
        @pages = build_pages
      end

      private

      def count_total_pages
        if ((@resources.size / @per_page) * @per_page) < @resources.size
          return (@resources.size / @per_page) + 1  
        end
        @resources.size / @per_page
      end

      def build_pages

      end

    end

  end

end

