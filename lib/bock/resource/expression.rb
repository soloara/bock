#encoding: utf-8
require 'erb'

module Bock

  module Resource
    
    module Expression
      
      def render text
        template = ERB.new text
        @content = to_html
        template.result(binding)
      end
      
    end
    
  end
  
end