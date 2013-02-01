require File.join(File.dirname(__FILE__), 'rspec_helper')
require 'bock/resource/markdown'
require 'nokogiri'
require 'time'

describe Bock::Resource::Markdown do

  shared_examples "markdown_instance" do |markdown|
    it "will get a valid Markdown instance" do
      markdown.should be_an_instance_of(Bock::Resource::Markdown)
      markdown.options.title.should == 'Hello World'
      markdown.options.date.should == Time.parse('2012-12-03 12:12:12 +0800')
      $doc = Nokogiri::HTML markdown.to_html
      $doc.css('h1').first.text.should == 'h1'
    end
  end

  describe "#new" do

    it "create a Markdown instance with options" do
      md = Bock::Resource::Markdown.new "# title", title: 'Hello'
      md.options.title.should == 'Hello'
    end

  end

  describe "@to_html" do

    it "will convert markdown to html" do
      md = Bock::Resource::Markdown.new "# title", title: 'Hello'
      $doc = Nokogiri::HTML md.to_html
      $doc.css('h1').first.node_name.should == 'h1'
      $doc.css('h1').first.text.should == 'title'
    end

  end

  describe "#parse" do
    File.open(File.join(File.dirname(__FILE__), 'md_docs/with_blog_attrs.md')) do |file|
      md = Bock::Resource::Markdown.parse file.read
      include_examples 'markdown_instance', md
    end
  end

  describe "#parse_from_file" do
    file_name = File.join(File.dirname(__FILE__), 'md_docs/with_blog_attrs.md')
    md = Bock::Resource::Markdown.parse_from_file file_name
    include_examples 'markdown_instance', md
  end

end