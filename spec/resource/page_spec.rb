require File.join(File.dirname(__FILE__), '../rspec_helper')
require 'bock/resource/page'

describe Bock::Resource::Page do
  
  describe '#new' do
    
    page = Bock::Resource::Page.new ResourceMock.build(6), 1, 5
    
    describe 'will create a instance of Page' do
      
      it "include number, total_number" do
        page.number.should == 1
        page.total_number.should == 5
      end
      
      it "include 6 resources" do
        page.resources.size.should == 6
        page.resources.first.should be_an_instance_of(ResourceMock)
      end
      
    end
    
  end
  
end