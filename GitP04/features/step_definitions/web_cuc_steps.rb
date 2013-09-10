require 'rack/test'


module AppHelper
  # Rack-Test expects the app method to return a Rack application
  def app
#    WebBasquetizer -> I don't undertstand why this doesnt work w a browser
    Sinatra::Application
  end
end
World(Rack::Test::Methods, AppHelper)

# ==================== SENDING STUFF ================

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

When /^with URL (.*)$/ do |theVerb|
  print "\nwith URL x"
  get theVerb
end

When /^sending POST w '(.*)'='(.*)'$/ do |key, value|
  print "\nsending POSt w x=y"
  post '/addrequest', key+'='+value
end


# ==================== CHECKING STUFF ================


Then /^on 1st add, the server put '(.+)' at location 0$/ do |stuff|
  print "\non 1st add, the server put x at location 0"
  last_response.body.should == "GET/addTextImmediate requested. I put :#{stuff}: at 0"
end

Then /^on 2nd add, the server put '(.+)' at location 1$/ do |stuff|
  print "\non 2nd add, the server put x at location 1"
  last_response.body.should == "GET/addTextImmediate requested. I put :#{stuff}: at 1"
end

Then /^fetching from (\d+) indeed produces '(.*)'$/ do |locationAsString, stuff|
  print "\nfetching from x indeed produces y"
  get '/getat/' + locationAsString
  last_response.body.should == stuff
end

Then /^the server stored httpAdd request at location (\d+)$/  do |location|
  print "\nthe server stored httpAdd request at location x"
  last_response.body.should == "addRequest request was stored at location #{location}"
end

Then /^the server stored the POST request at location (\d+)$/  do | location |
  print "\nthe server stored the POST request at location z"
  last_response.body.should == "addrequest request was stored at location #{location}"
end

Then /^the server brings back from location (\d+) the request verb payload '(.*)'$/ do |location, expData|
  print "\nthe server brings back from location x the request verb payload y"
  get '/getRequest-VerbAt/' + location
  last_response.body.should == "#{expData}"
end

Then /^the server brings back from POST at location (\d+) the data '(.*)'='(.*)'$/ do |location, dataKey, expData|
  print "\nthe server brings back from POST at location a the data b=c"
  get "/getRequest-DataFieldAt/#{dataKey}/#{location}"
  last_response.body.should == "#{expData}"
end






