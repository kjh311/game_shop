require 'rubygems'
require 'bundler'
Bundler.require

# Models
require './models/game'

# Controllers
require './app'

use Rack::MethodOverride
run GamesApp
