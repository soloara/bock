require 'ostruct'
require 'bock/resource/expression'

class ResourceMock

  include Bock::Resource::Expression

  ERB_1 = <<-EOF
    <h1><%= @options.title %></h1>
    <h2><%= @options.auther %></h2>
    <h3><%= @options.index %></h3>
    <div>
      <%= @content %>
    </div>
  EOF

  def initialize options={}
    @default_options = {title: 'Hello', auther: 'Zack Yang'}
    @default_options.merge!(options)
    @options = OpenStruct.new @default_options
  end

  def to_html
    "<h5>Hello World</h5>"
  end

  def self.build num
    resources = []
    num.times do |i|
      resources << ResourceMock.new(index: i)
    end
    resources
  end

end
