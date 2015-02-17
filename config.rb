require 'pry'
require 'json'
require 'sinatra-websocket'
require 'sinatra/asset_snack'
require 'sinatra/handlebars'
require 'better_errors'
Dir[File.dirname(__FILE__) + '/app/**/*.rb'].each {|file| require file }

class DominionConfig < Sinatra::Base

  # Error Handling
  configure :development do
    require 'dotenv'
    Dotenv.load
    use BetterErrors::Middleware
    BetterErrors.application_root = __dir__
  end

  # Configure server
  set :server, 'puma'
  use Rack::Session::Cookie, key: 'rack.session',
                             path: '/',
                             secret: ENV['SESSION_SECRET']

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
end
