require 'rack/test'
require_relative '../../src/n13_req_headers01'

module AppHelper
  # Rack-Test expects the app method to return a Rack application
  def app
#    WebBasquetizer -> I don't undertstand why this doesnt work w a browser
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
  last_response.body.should == "via GET/add put:#{stuff}. at 0"
end

Then /^on 2nd add, the server put '(.+)' at location 1$/ do |stuff|
  last_response.body.should == "via GET/add put:#{stuff}. at 1"
end

Then /^fetching from (\d+) indeed produces '(.*)'$/ do |locationAsString, stuff|
  get '/getat/' + locationAsString
  last_response.body.should == stuff
end

When /^sending get\/getheaderkey\/(.*) answers (.*)$/ do |header, wishedHeaderKey|
  get "getheaderkey/#{header}"
  #last_response.body.should == "boo"
  last_response.body.should == "via getheaderkey/ value for: #{header} is #{wishedHeaderKey}"
end




