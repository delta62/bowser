$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'src'))

require 'app'

require 'coveralls'
Coveralls.wear!
