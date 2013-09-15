require 'sinatra'
require_relative 'webmuffinbasquet'

#class WebBasquetizer < Sinatra::Base
    myBasquet = WebMuffinBasquet.aPersistentBasquet

# ==================== INITIALIZING STUFF ================

get '/' do
    out = "Welcome to my iittle toy Basquet"
  end

  get '/FRESH_DB' do  # GOOK: USE ONLY FOR TESTING, NOT PRODUCTION!!
    myBasquet = WebMuffinBasquet.newPersistentBasquetPlease
    out = "New basquet w #{myBasquet.size.to_s} items."
  end

# ==================== STORING STUFF ================

get '/addImmediate/:newStuff' do
  theStuff = params[:newStuff]
  addedAt = myBasquet.zadd(theStuff)
  out = "GET/addImmediate of :#{theStuff}: at #{addedAt}"
end

get '/addGETRequest/*' do
  addedAt = myBasquet.zadd(request)
  out = "addGETRequest request stored at #{addedAt}"
end

post '/addPOSTRequest' do
  addedAt = myBasquet.zadd(request)
  out = "addPOSTRequest request stored at #{addedAt}"
end

# ==================== RETRIEVING STUFF ================

get '/getAt/:location' do
  out = myBasquet.gimmeAt( params[:location].to_i )
end

get '/getRequestVerbAt/:location' do
  theRequest = myBasquet.gimmeAt( params[:location].to_i )
  out = theRequest.env["PATH_INFO"]
end

get '/getAtRequestDataField/:location/:dataKey' do
  theRequest = myBasquet.gimmeAt( params[:location].to_i )
  dataValue = theRequest.env["rack.request.form_hash"][ params[:dataKey] ]
  out = dataValue
end

# ==================== DEPRECATED ================

