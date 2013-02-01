dir = File.join(File.dirname(__FILE__), '..', 'lib')
$LOAD_PATH.unshift dir unless $LOAD_PATH.include?(dir)

require File.join(File.dirname(__FILE__), 'helpers', 'resource_mock')