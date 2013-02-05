require File.join(File.dirname(__FILE__), '../rspec_helper')
require 'bock/post/collection'


describe Bock::Post::Collection do

  mark_docs_dir = File.join(File.dirname(__FILE__), "../md_docs")

  after :all do
    MDFilesCreater.clear
  end

  describe '#new' do

    it "will create a instance of Collection with two aguments (dir, parser instance)" do      
      post = double('post', to_html: 'this is html')
      parser = double('parser', result: post)
      MDFilesCreater.build 21
      collection = Bock::Post::Collection.new mark_docs_dir, parser 
      collection.should be_an_instance_of Bock::Post::Collection
      collection.posts.size.should == 21
    end

  end

  describe "#pagenate" do

    it "will pagenate all posts to many pages the argument is per_page num" do
      post = double('post', to_html: 'this is html')
      parser = double('parser', result: post)
      MDFilesCreater.build 21
      collection = Bock::Post::Collection.new mark_docs_dir, parser
      collection.pagenate(5).size.should == 5
    end
  end

end