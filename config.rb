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
    templates '/javascript/templates.js', ['app/assets/templates/**/*']
  }

  # Asset Compilation
  register Sinatra::AssetSnack
  asset_map '/javascript/application.js', ['assets/js/**/*.js', 'assets/js/**/*.coffee']
  asset_map '/stylesheets/application.css', ['assets/stylesheets/**/*.css', 'assets/stylesheets/**/*.scss']
  asset_map '/javascript/game.js', ['assets/websockets/game.coffee']
  asset_map '/javascript/lobby.js', ['assets/websockets/lobby.coffee']

  # Error Handling
  configure :development do
    use BetterErrors::Middleware
    BetterErrors.application_root = __dir__
  end
end
