require File.join(File.dirname(__FILE__), '../rspec_helper')
require 'ostruct'
require 'nokogiri'

describe Bock::Resource::Expression do
  
  describe "@render" do
    
    it "should return a whole article html." do
      resource_mock = ResourceMock.new
      $doc = Nokogiri::HTML resource_mock.render(ResourceMock::ERB_1)
      $doc.css('h1').first.text.should == 'Hello'
      $doc.css('h2').first.text.should == 'Zack Yang'
      $doc.css('h5').first.text.should == 'Hello World'
    end
    
  end
  
end