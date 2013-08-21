require "sinatra"
require_relative "basquet"

myBasquet = Basquet.new

get '/' do
  out = "hello from persistent webBasquet"
  $built_response = out
end

get '/add/:newStuff' do
  theStuff = params[:newStuff]
  addedAt = myBasquet.add(theStuff)
  out = "request to add by GET '#{theStuff}'. Added at #{addedAt}"
  $built_response = out
end

post '/add' do
  theStuff = params[:newStuff]
  addedAt = myBasquet.add(theStuff)
  out = "request to add by POST '#{theStuff}'. Added at #{addedAt}"
  $built_response = out
end

get '/getAt/:location' do
  location = params[:location].to_i
  theStuff = myBasquet.gimmeAt(location)
  out = theStuff
  $built_response = out
end

