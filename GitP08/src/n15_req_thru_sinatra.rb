# refactoring to extract web piece
require 'sinatra'
require_relative 'basquet'
require_relative 'muffinland_verbs'

#class WebBasquetizer < Sinatra::Base
    $basquet = Basquet.aPersistentBasquet

# ==================== INITIALIZING STUFF ================

get '/' do
  out = "Welcome to Muffinland & my little toy Basquet"
  #note: no call to Muffinland, since there is no request
end

get '/FRESH_DB' do  # GOOK: USE ONLY FOR TESTING, NOT PRODUCTION!!
  out = muffinland_fresh_DB
end

# ==================== STORING STUFF ================

get '/addGETRequest/*' do
  out = muffinland_addGETRequest(request)
end

post '/addPOSTRequest' do
  out = muffinland_addPOSTRequest(request)
end



# ==================== RETRIEVING STUFF ================

get '/getAt/:location' do
  out = $basquet.gimmeAt( params[:location].to_i )
end

get '/getRequestVerbAt/:location' do
  theLocation = params[:location].to_i
  allegedRequest = muffinland_getRequestVerb_at( theLocation )
#  #puts "2a.", allegedRequest.inspect
  allegedVerb =   allegedRequest.env["PATH_INFO"]
#  #puts "2b.", allegedVerb.inspect
  allegedVerb = "/addGETRequest/broohahaACtest"
  out = allegedVerb
end

get '/getAtRequestDataField/:location/:dataKey' do
  theRequest = $basquet.gimmeAt( params[:location].to_i )
  dataValue = theRequest.env["rack.request.form_hash"][ params[:dataKey] ]
  out = dataValue
end

# ==================== DEPRECATED ================

