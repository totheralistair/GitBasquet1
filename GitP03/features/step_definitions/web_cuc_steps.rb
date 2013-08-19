require 'rack/test'

When /^with a fresh Basquet$/ do
  get "/FRESH_DB"
  last_response.body.should == "0"
end

When /^sending GET (.*) from the web client$/ do |requestpath|
  get(requestpath)
end

Then /^on 1st add, server put '(.+)' at location 0$/ do |stuff|
  last_response.body.should == "GET/add/#{stuff}. Added at 0"
end

Then /^on 2nd add, server put '(.+)' at location 1$/ do |stuff|
  last_response.body.should == "GET/add/#{stuff}. Added at 1"
end

Then /^fetching from (\d+) indeed produces '(.*)'$/ do |locationAsString, stuff|
  get '/getAt/' + locationAsString
  last_response.body.should == stuff
end
