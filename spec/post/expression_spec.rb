require File.join(File.dirname(__FILE__), '../rspec_helper')
require 'ostruct'
require 'nokogiri'

describe Bock::Post::Expression do
  
  describe "@render" do
    
    shared_examples "nokogiri doc" do |doc| 
      it "is empty when first created" do
        doc.css('h1').first.text.should == 'Hello'
        doc.css('h2').first.text.should == 'Zack Yang'
        doc.css('h5').first.text.should == 'Hello World'
      end
    end
    
    describe "should return a whole article html with a erb as arg." do
      post_mock = PostMock.new
      $doc = Nokogiri::HTML post_mock.render(PostMock::ERB_1)
      include_examples "nokogiri doc", $doc
    end
    
    describe "should return a whole article html." do
      post_mock = PostMock.new
      post_mock.erb = PostMock::ERB_1
      $doc = Nokogiri::HTML post_mock.render
      include_examples "nokogiri doc", $doc
    end
    
    
    
  end
  
end