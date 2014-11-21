$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'src'))

require 'coveralls'
Coveralls.wear!

require 'app'

