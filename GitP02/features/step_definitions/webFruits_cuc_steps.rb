require 'rack/test'
# --- For Scenario: simple fruit list to JSON -------------
When /^sending GET (.*) from the web client$/ do |requestpath|
  get(requestpath)
end

Then /^should have gotten back from the server this JSON:$/ do |json|
  raise('Alistair-forced failure!'+last_response.body) unless 5==5
  JSON.parse(last_response.body).should == JSON.parse(json)
end


