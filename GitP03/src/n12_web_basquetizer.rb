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

  get '/add/:newStuff' do
    theStuff = params[:newStuff]
    addedAt = myBasquet.add(theStuff)
    out = "GET/add/#{theStuff}. Added at #{addedAt}"
  end

  get '/getat/:location' do
    location = params[:location].to_i
    theStuff = myBasquet.gimmeAt(location)
    out = theStuff
  end

#end

