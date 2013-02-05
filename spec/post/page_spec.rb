require File.join(File.dirname(__FILE__), '../rspec_helper')
require 'bock/post/page'

describe Bock::Post::Page do

  describe '#new' do

    describe 'will create a instance of Page' do

      page = Bock::Post::Page.new PostMock.build(6), 2, 5

      it "include number, total_number" do
        page.number.should == 2
        page.total_number.should == 5
      end

      it "include 6 posts" do
        page.posts.size.should == 6
        page.posts.first.should be_an_instance_of(PostMock)
      end

    end

  end

  describe "all relational pages path " do

    page = Bock::Post::Page.new PostMock.build(6), 2, 5

    it "@path" do
      page.path.should == '2.html'
    end

    describe "@next_page_path" do
      
      it "will return a nil while the num is the last page" do
        page.number = 5
        page.next_page_path.should be nil
      end
      
      it "will return 3 while the num is 2" do
        page.number = 2
        page.next_page_path.should == '3.html'
      end
      
      it "will return 5.html while the page is 3 and argument is 2 which means after 2 pages" do
        page.number = 3
        page.next_page_path(2).should == '5.html'
      end

    end

    describe "@previous_page_path" do
      
      it "will return a nil while the num is the first page" do
        page.number = 1
        page.previous_page_path.should be nil
      end
      
      it "will return 1 while the num is 2" do
        page.number = 2
        page.previous_page_path.should == '1.html'
      end
      
      it "will return 1.html while the page is 3 and argument is 2 which means before 2 pages" do
        page.number = 3
        page.previous_page_path(2).should == '1.html'
      end

    end
    
    describe "@first_page_path" do
      
      it "return the 1.html" do
        page.first_page_path.should == '1.html'
      end
      
    end
    
    describe "@last_page_path" do
      
      it "return the 5.html" do
        page.last_page_path.should == '5.html'
      end
      
    end

  end
  
  describe "@to_html" do
    
    
    
  end

end