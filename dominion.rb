require 'sinatra/base'
require './config'

class Dominion < Sinatra::Base
  use DominionConfig

  get '/' do
    if session[:user]
      erb :lobby
    else
      redirect '/sign_in'
    end
  end

  get '/sign_in' do
    erb :sign_in
  end

  post '/sign_in' do
    name = params[:username]
    if UserManager.user_exists?(name)
      @error = 'Username is already in use'
      erb :sign_in
    else
      session[:user] = UserManager.add_user(name)
      redirect '/'
    end
  end

  get '/sign_out' do
    UserManager.remove_user(session[:user])
    session[:user] = nil
    redirect '/'
  end
end
