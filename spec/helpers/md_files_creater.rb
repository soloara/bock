class MDFilesCreater

  DIR = File.join(File.dirname(__FILE__), '../md_docs')

  def self.build num
    self.clear
    paths = []
    num.times do |i|
      path = File.join(DIR, "test_md_#{i}.md")
      file = File.new(path, File::CREAT|File::TRUNC|File::RDWR, 0644)
      file.puts <<-EOF
title: Hello World #{i}
date: 2012-12-03 12:12:12 +0800

==========

###### Header
# h1
EOF
      file.close
      paths << path
    end
    paths
  end

  def self.clear
    Dir.foreach DIR do |file_name|
      File.delete File.join(DIR, file_name) if file_name =~ /test_md_\d+\.md/
    end
  end

end