require 'sinatra/base'
require './lib/message'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/users/sign_up' do
    erb :"users/sign_up"
  end

  post '/users/sign_up' do
    erb :"messages/new"
  end

  get '/messages' do
    @messages = Message.all
    erb :messages
  end

  get '/messages/new' do
    erb :"messages/new"
  end

  post '/messages/new' do
    Message.create(msg: params['msg'])
    redirect :messages
  end


  run! if app_file == $0

end
