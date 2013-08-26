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
  print "\nstarting the site is responding"
  get "/"
  last_response.body.should == "Welcome to my iittle toy Basquet"
end

When /^with a fresh Basquet$/ do
  print "\nwith a fresh Basquet"
  get "/FRESH_DB"
  last_response.body.should == "New basquet w 0 items in it."
end

When /^sending GET (.*) from the web client$/ do |requestpath|
  print "\nsending GET x from the web client"
  get(requestpath)
end

Then /^on 1st add, the server put '(.+)' at location 0$/ do |stuff|
  print "\non 1st add, the server put x at location 0"
  last_response.body.should == "via GET/textAdd put:#{stuff}. at 0"
end

Then /^on 2nd add, the server put '(.+)' at location 1$/ do |stuff|
  print "\non 2nd add, the server put x at location 1"
  last_response.body.should == "via GET/textAdd put:#{stuff}. at 1"
end

Then /^fetching from (\d+) indeed produces '(.*)'$/ do |locationAsString, stuff|
  print "\nfetching from x indeed produces y"
  get '/getat/' + locationAsString
  last_response.body.should == stuff
end

When /^sending get\/getheaderkey\/(.*) answers (.*)$/ do |header, wishedHeaderKey|
  print "\nsending get.getheaderky.x answers y"
  get "getheaderkey/#{header}"
  last_response.body.should == "via getheaderkey/ value for: #{header} is #{wishedHeaderKey}"
end
#============================================
When /^sending '(.*)'$/ do |theVerb|
  print "\nsending x"
  @requestedVerb = theVerb
  get @requestedVerb
end

Then /^the server stored httpAdd request at location (\d+)$/  do |location|
  print "\nthe server stored httpAdd request at location x"
  last_response.body.should == "httpAdd request was stored at location #{location}"
end

Then /^sendinghttpPOSTadd (.*) = (.*) location (\d+)$/  do | where, what, location |
  print "\nsendinghttpPostadd x = y location z"
  where = 'acData'
  what = 'oogaPOSTboogo'
  last_response.body.should == "requested httpPOSTadd for #{where} = #{what} was stored at location #{location}"
end

Then /^the server brings back from location (\d+) the data '(.*)'$/ do |location, expData|
  print "\nthe server brings back from location x the data y"
  get '/httpGetat/' + location
  last_response.body.should == "#{expData}"
end

Then /^the server brings back from POST at location (\d+) the data '(.*)'$/ do |location, expData|
  print "\nthe server brings back from POST at location x the data y"
  get '/httpFromPOSTgetat/' + location
  last_response.body.should == "#{expData}"
end




When /^sending POST w '(.*)'='(.*)'$/ do |key, value|
  print "\nsending POSt w x=y:"
  post '/httpPOSTadd', key+'='+value
end















