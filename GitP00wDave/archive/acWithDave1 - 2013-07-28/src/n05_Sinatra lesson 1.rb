require "sinatra"

# trying to listen to localhost:4567

get '/' do
  "hi pappy!"
end    # yayy this works to an empty browser req!


get '/foo' do
  t = %w[text/css text/html application/javascript]
  p request.accept              # ['text/html', '*/*']
  p request.accept? 'text/xml'  # true
  request.preferred_type(t)   # 'text/html'
  request.body                # request body sent by the client (see below)
  request.scheme              # "http"
  request.script_name         # "/example"
  request.path_info           # "/foo"
  request.port                # 80
  request.request_method      # "GET"
  request.query_string        # ""
  request.content_length      # length of request.body
  request.media_type          # media type of request.body
  request.host                # "example.com"
  request.get?                # true (similar methods for other verbs)
  request.form_data?          # false
  request["some_param"]       # value of some_param parameter. [] is a shortcut to the params hash.
  request.referrer            # the referrer of the client or '/'
  request.user_agent          # user agent (used by :agent condition)
  request.cookies             # hash of browser cookies
  request.xhr?                # is this an ajax request?
  p request.url                 # "http://example.com/example/foo"
  request.path                # "/example/foo"
  request.ip                  # client IP address
  request.secure?             # false (would be true over ssl)
  request.forwarded?          # true (if running behind a reverse proxy)
  request.env                 # raw env hash handed in by Rack
end

=begin
post '/' do
  puts "calling POST"#
  puts "param=" + params.to_s  + "."
end

post '/action' do
  puts "calling POST/ACTION"#
  puts "Post/Action " + params[:from] + ',' + params[:to]  + "."
end

get '/hello/:name' do
  "Hello to #{params[:name]}!"
end

get '/tell/:whom/to/:what' do
  "Tell #{params[:whom]}: #{params[:what]} for me !"
end

get '/buzz * with *' do |whom, what|
  "Tell #{whom} I'm going to buzz him with #{what} !"
end

def say_hello_12
  "Hello 12"
end
=end


