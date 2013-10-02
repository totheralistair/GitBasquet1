# refactoring to extract web piece
require 'sinatra'
require_relative 'basquet'
require_relative 'n14_req_headers_asideFromWeb'

#class WebBasquetizer < Sinatra::Base
    $basquet = Basquet.aPersistentBasquet

# ==================== INITIALIZING STUFF ================

get '/' do
    out = muffinland_home
end

get '/FRESH_DB' do  # GOOK: USE ONLY FOR TESTING, NOT PRODUCTION!!
  out = muffinland_fresh_DB
end

# ==================== STORING STUFF ================

get '/addGETRequest/*' do
  out = muffinland_addGETRequest
end

post '/addPOSTRequest' do
  out = muffinland_addPOSTRequest
end



# ==================== RETRIEVING STUFF ================

get '/getAt/:location' do
  out = $basquet.gimmeAt( params[:location].to_i )
end

get '/getRequestVerbAt/:location' do
  theLocation = params[:location].to_i
  out = muffinland_getRequestVerb_of_at($basquet, theLocation)
end

get '/getAtRequestDataField/:location/:dataKey' do
  theRequest = $basquet.gimmeAt( params[:location].to_i )
  dataValue = theRequest.env["rack.request.form_hash"][ params[:dataKey] ]
  out = dataValue
end

# ==================== DEPRECATED ================

