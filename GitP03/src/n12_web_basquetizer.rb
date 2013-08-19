require 'sinatra'
require 'json'
require_relative 'basquet'

class WebBasquetizer < Sinatra::Base
  myBasquet = Basquet.aPersistentBasquet

  get '/FRESH_DB' do
    myBasquet = Basquet.newPersistentBasquetPlease
    out = "done"
  end

  get '/echoME' do
    out = "echoME!"
  end

  get '/add/:newStuff' do
    theStuff = params[:newStuff]
    addedAt = myBasquet.add(theStuff)
    out = "Request to add by GET '#{theStuff}'. Added at #{addedAt}"
  end

  get '/getAt/:location' do
    location = params[:location].to_i
    theStuff = myBasquet.gimmeAt(location)
    out = theStuff
  end

end

