require File.join(File.dirname(__FILE__), '../rspec_helper')
require 'bock/post/parser'

describe Bock::Post::Parser do

  after :all do
    MDFilesCreater.clear
  end

  describe "#new" do

    it "should return a instance of Parser the arguments is a posts map" do
      parser = Bock::Post::Parser.new '.md' => double('markdown')
      parser.should be_an_instance_of Bock::Post::Parser
    end

  end

  describe "#result" do

    it "should return a instance of right post instance" do
      paths = MDFilesCreater.build 1
      post_mock_klass = double('markdown', :new => 'post_instance')
      post_mock_klass.should_receive(:new).with(kind_of(String))
      parser = Bock::Post::Parser.new '.md' => post_mock_klass
      parser.result(paths.first).should == 'post_instance'
    end
  end

end