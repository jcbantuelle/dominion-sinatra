require 'pry'
require 'sinatra-websocket'
require 'sinatra/asset_snack'
require 'sinatra/handlebars'
require 'better_errors'
Dir[File.dirname(__FILE__) + '/app/**/*.rb'].each {|file| require file }

class DominionConfig < Sinatra::Base

  # Configure server
  set :server, 'puma'
  enable :sessions

  # Handlebars
  register Sinatra::Handlebars
  handlebars {
    templates '/javascript/templates.js', ['assets/js/templates/game/*', 'assets/js/templates/lobby/*']
  }

  # Asset Compilation
  register Sinatra::AssetSnack
  asset_map '/javascript/application.js', ['assets/js/*.coffee']
  asset_map '/javascript/game.js', ['assets/js/websockets/game.coffee']
  asset_map '/javascript/lobby.js', ['assets/js/websockets/lobby.coffee']
  asset_map '/stylesheets/application.css', ['assets/stylesheets/**/*.css', 'assets/stylesheets/**/*.scss']

  # Error Handling
  configure :development do
    use BetterErrors::Middleware
    BetterErrors.application_root = __dir__
  end
end
