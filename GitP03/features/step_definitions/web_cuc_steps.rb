require 'rack/test'

When /^with a fresh Basquet$/ do
  get "/FRESH_DB"
  last_response.body.should == "done"
end

When /^sending GET (.*) from the web client$/ do |requestpath|
  get(requestpath)
end

Then /^the server should reply "([^"]*)"$/ do |expectedResult|
  raise('Alistair-forced failure!'+last_response.body) unless 5==5
  last_response.body.should == expectedResult
end

Then /^the server should have replied Request to add by GET 'item1' Added at 0$/ do
  last_response.body.should == "Request to add by GET 'item1'. Added at 0"
end

Then /^the server should have added it at location (\d+)$/ do |locationAsString|
  get '/getAt/' + locationAsString
  last_response.body.should == "item1"
end

Then /^the server should have 2-replied: Request to add by GET 'item2' Added at 1$/ do
  last_response.body.should == "Request to add by GET 'item2'. Added at 1"
end

Then /^the server should have item2 added at location (\d+)$/ do |locationAsString|
  get '/getAt/' + locationAsString
  last_response.body.should == "item2"
end

 1
