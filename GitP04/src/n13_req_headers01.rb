require 'sinatra'
require 'json'
require_relative 'basquet'

#class WebBasquetizer < Sinatra::Base
    myBasquet = Basquet.aPersistentBasquet

  get '/' do
    out = "Welcome to my iittle toy Basquet"
  end

  get '/FRESH_DB' do
    myBasquet = Basquet.newPersistentBasquetPlease
    out = "New basquet w #{myBasquet.size.to_s} items in it."
  end

# ==================== RETRIEVING STUFF ================

get '/getat/:location' do
  out = myBasquet.gimmeAt( params[:location].to_i )
end

get '/getRequest-VerbAt/:location' do
  theRequest = myBasquet.gimmeAt( params[:location].to_i )
  out = theRequest.env["PATH_INFO"]
end

get '/getRequest-DataFieldAt/:dataKey/:location' do
  wholeRequest = myBasquet.gimmeAt( params[:location].to_i )
  dataValue = wholeRequest.env["rack.request.form_hash"][ params[:dataKey] ]
  out = dataValue
end

# ==================== STORING STUFF ================

get '/addTextImmediate/:newStuff' do
  theStuff = params[:newStuff]
  addedAt = myBasquet.zadd(theStuff)
  out = "GET/addTextImmediate requested. I put :#{theStuff}: at #{addedAt}"
end

get '/addRequest/*' do
  addedAt = myBasquet.zadd(request)
  out = "addRequest request was stored at location #{addedAt}"
end

post '/addrequest' do
  addedAt = myBasquet.zadd(request)
  out = "addrequest request was stored at location #{addedAt}"
end

# ==================== DEPRECATED ================

