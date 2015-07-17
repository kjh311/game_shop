require 'rubygems'
require 'bundler'
Bundler.require

require '.models/games'

requier './app'

use Rack::MethodOverride
