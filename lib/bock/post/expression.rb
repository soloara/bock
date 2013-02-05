#encoding: utf-8
require 'erb'

module Bock

  module Post
    
    module Expression
      
      def render text=nil
        template = ERB.new (text || self.erb)
        @content = to_html
        template.result(binding)
      end
      
    end
    
  end
  
end