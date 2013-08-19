require 'rack/test'
# --- For Scenario: simple fruit list to JSON -------------
When(/^web client just sent GET (.*)$/) do |requestpath|
  get(requestpath)
end

Then /^server should reply w these name:color pairs in JSON:$/ do |json|
#  When /^server should reply w these name:color pairs in "([^"]*)"$/ do |arg1|
  raise('Alistair-forced failure!'+last_response.body) unless 5==5
  JSON.parse(last_response.body).should == JSON.parse(json)
end


