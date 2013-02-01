require File.join(File.dirname(__FILE__), '../rspec_helper')
require 'bock/resource/collection'


describe Bock::Resource::Collection do

  before(:each) do
    @resources = ResourceMock.build(21)
  end

  describe '#new' do
    
    describe "will create a instance of Collection " do
      
      it "include some pages, Per page`s resources number depend on the 2.nd argument." do
        collection = Bock::Resource::Collection.new @resources, 5
        collection.total_pages.should == 5
      end
      
    end
    
  end
  
end