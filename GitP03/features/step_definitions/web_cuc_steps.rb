require 'rack/test'
require_relative '../../src/n12_web_basquetizer'

module AppHelper
  # Rack-Test expects the app method to return a Rack application
  def app
#    WebBasquetizer
    Sinatra::Application
  end
end
World(Rack::Test::Methods, AppHelper)


When /^the site is responding$/ do
  get "/"
  last_response.body.should == "Welcome to my iittle toy Basquet"
end

When /^with a fresh Basquet$/ do
  get "/FRESH_DB"
  last_response.body.should == "0"
end

When /^sending GET (.*) from the web client$/ do |requestpath|
  get(requestpath)
end

Then /^on 1st add, the server put '(.+)' at location 0$/ do |stuff|
  last_response.body.should == "GET/add/#{stuff}. Added at 0"
end

Then /^on 2nd add, the server put '(.+)' at location 1$/ do |stuff|
  last_response.body.should == "GET/add/#{stuff}. Added at 1"
end

Then /^fetching from (\d+) indeed produces '(.*)'$/ do |locationAsString, stuff|
  get '/getat/' + locationAsString
  last_response.body.should == stuff
end
