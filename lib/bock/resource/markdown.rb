#encoding: UTF-8

require 'maruku'
require 'yaml'
require 'ostruct'
require 'bock/resource/expression'

module Bock

  module Resource

    class Markdown < Maruku
      
      include Bock::Resource::Expression

      attr_reader :options

      def initialize md_doc, options={}
        super(md_doc)
        @options = OpenStruct.new options
      end
      
      class << self
      
        
        # it could parse a markdown text 
        # get the options section and content section
        # return a instance of Morkdown
        def parse text
          array = text.split(/^\={3,}\n/)
          options = YAML.load array.first
          md_docs = array[1..-1].join("===\n")
          new md_docs, options
        end
        
        
        
        def parse_from_file path
          file = File.open(path, 'r')
          parse(file.read)
        end
      
      end

    end

  end

end