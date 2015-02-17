require 'sinatra/base'
require './config'

class Dominion < Sinatra::Base
  use DominionConfig

  get '/' do
    require_login
    erb :lobby
  end

  get '/sign_in' do
    erb :sign_in
  end

  post '/sign_in' do
    if PlayerManager.player_exists?(params[:username])
      @error = 'Username is already in use'
      erb :sign_in
    else
      session[:player] = PlayerManager.add_player(params[:username])
      redirect '/'
    end
  end

  get '/sign_out' do
    require_login
    PlayerManager.remove_player(session[:player])
    session[:player] = nil
    redirect '/'
  end

  get '/websockets' do
    request.websocket do |ws|
      ws.onopen do
        Websockets::Manager.add_socket(ws, session[:player])
        Websockets::Lobby.refresh
      end
      ws.onmessage do |msg|
        data = JSON.parse msg
        action = data['action']
        Websockets::Actions.action_class(action).send(action, data, session[:player]) if Websockets::Actions.valid_action(action)
        Websockets::Lobby.refresh
      end
      ws.onclose do
        Websockets::Manager.remove_socket(session[:player])
        Websockets::Lobby.refresh
      end
    end
  end

  helpers do
    def require_login
      redirect '/sign_in' unless session[:player]
    end
  end

end
