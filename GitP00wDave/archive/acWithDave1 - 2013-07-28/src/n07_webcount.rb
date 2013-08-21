require "sinatra"

count = 0

get '/addImmediate/:newStuff' do
  out = "in addImmediate: count was #{count}"
  count += 1
  out += ", count now is #{count}. "
  $built_response = out
end

get '/getAt/:location' do
  out = "in getAt: count was #{count}"
  count += 1
  out += ", count now is #{count}"
  $built_response = out
end
