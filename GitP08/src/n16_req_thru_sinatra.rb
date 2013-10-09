require 'sinatra'
require_relative 'muffinland'

get '/' do "Welcome to Muffinland" ;end
get '/FRESH_DB' do ml_fresh_DB ;end # SCARY: USE ONLY FOR TESTING, NOT PRODUCTION!!
get '/get/*' do ml_add(request) ;end
post '/post' do ml_add(request) ;end

get '/path/:loc' do ml_path_at( params[:loc].to_i ) ;end
get '/dataforat/:key/:loc' do
  r = ml_data_for_at( params[:key], params[:loc].to_i )
  end



