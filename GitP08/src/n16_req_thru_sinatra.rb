require 'sinatra'

require_relative 'basquet'
require_relative 'muffinland'


get '/' do "Welcome to Muffinland" ;end
get '/FRESH_DB' do ml_fresh_DB ;end # SCARY: USE ONLY FOR TESTING, NOT PRODUCTION!!
get '/get/*' do ml_add_request(request) ;end
post '/post' do ml_add_request(request) ;end
get '/path/:loc' do ml_path_at( params[:loc].to_i ) ;end

