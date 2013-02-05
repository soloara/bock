dir = File.join(File.dirname(__FILE__), '..', 'lib')
$LOAD_PATH.unshift dir unless $LOAD_PATH.include?(dir)

require File.join(File.dirname(__FILE__), 'helpers', 'post_mock')
require File.join(File.dirname(__FILE__), 'helpers', 'md_files_creater')