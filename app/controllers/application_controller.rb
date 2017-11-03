require_relative '../../config/environment'
require 'pry'

class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end

  post '/login' do
    user = User.find_by(username: params[:username])
    #binding.pry
    session[:user_id] = @user.id
    redirect '/account', 302
  end

  get '/account' do
    @user = User.find_by(id: session[:user_id])
    erb :account
  end

  get '/logout' do

  end


end
