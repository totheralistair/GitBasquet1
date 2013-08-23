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
    out = myBasquet.size.to_s
  end

  get '/textAdd/:newStuff' do
    theStuff = params[:newStuff]
    addedAt = myBasquet.add(theStuff)
    out = "via GET/textAdd put:#{theStuff}. at #{addedAt}"
  end

  get '/getat/:location' do
    location = params[:location].to_i
    theStuff = myBasquet.gimmeAt(location)
    out = theStuff
  end

get '/getheaderkey/:wishedHeaderKey' do
  wishedHeaderKey = params[:wishedHeaderKey]
  winningValue = "not found"
  request.env.each do |headerKey, headerValue|
    if headerKey==wishedHeaderKey  then
      winningValue = headerValue
    end
  end
  out = "via getheaderkey/ value for: #{wishedHeaderKey} is #{winningValue}"
end

get '/httpAdd/*' do
  requestedVerb = request.env["PATH_INFO"]
  addedAt = myBasquet.add(request)
  out = "request for #{requestedVerb} was stored at location #{addedAt}"
end

get '/httpGetat/:location' do
  location = params[:location].to_i
  wholeRequest = myBasquet.gimmeAt(location)
  storedVerb = wholeRequest.env["PATH_INFO"]
  out = storedVerb
end


