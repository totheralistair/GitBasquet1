require "sinatra"
require 'json/pure'

get '/' do
  say_hello_12
end

get '/fog' do
  p "start test printout"
  #t = %w[text/css text/html application/javascript]
  #p request.accept              # ['text/html', '*/*']
  #p request.accept? 'text/xml'  # true
  #p request.preferred_type(t)   # 'text/html'
  p "request.body|#{request.body}|"                # request body sent by the client (see below)
  #p request.scheme              # "http"
  #p request.script_name         # "/example"
  #p request.path_info           # "/foo"
  #p request.port                # 80
  p "request.request_method|#{request.request_method}|"      # "GET"
  #p request.query_string        # ""
  #p request.content_length      # length of request.body
  #p request.media_type          # media offerRaw of request.body
  #p request.host                # "example.com"
  #p request.get?                # true (similar methods for other verbs)
  #p request.form_data?          # false
  #p request["some_param"]       # value of some_param parameter. [] is a shortcut to the params hash.
  #p request.referrer            # the referrer of the client or '/'
  #p request.user_agent          # user agent (used by :agent condition)
  #p request.cookies             # hash of browser cookies
  #p request.xhr?                # is this an ajax request?
  p "request.url|#{request.url}|"                 # "http://example.com/example/foo"
  p "request.path:#{request.path}:"                # "/example/foo"
  #p request.ip                  # client IP address
  #p request.secure?             # false (would be true over ssl)
  #p request.forwarded?          # true (if running behind a reverse proxy)
  #p request.env                 # raw env hash handed in by Rack
  p "params|#{params}|"
  p "end test printout"
  "Hello 13"
end

get '/fog/:name' do
  p "start test printout"
  #t = %w[text/css text/html application/javascript]
  #p request.accept              # ['text/html', '*/*']
  #p request.accept? 'text/xml'  # true
  #p request.preferred_type(t)   # 'text/html'
  p "request.body|#{request.body}|"                # request body sent by the client (see below)
  #p request.scheme              # "http"
  #p request.script_name         # "/example"
  #p request.path_info           # "/foo"
  #p request.port                # 80
  p "request.request_method|#{request.request_method}|"      # "GET"
  #p request.query_string        # ""
  #p request.content_length      # length of request.body
  #p request.media_type          # media offerRaw of request.body
  #p request.host                # "example.com"
  #p request.get?                # true (similar methods for other verbs)
  #p request.form_data?          # false
  #p request["some_param"]       # value of some_param parameter. [] is a shortcut to the params hash.
  #p request.referrer            # the referrer of the client or '/'
  #p request.user_agent          # user agent (used by :agent condition)
  #p request.cookies             # hash of browser cookies
  #p request.xhr?                # is this an ajax request?
  p "request.url|#{request.url}|"                 # "http://example.com/example/foo"
  p "request.path|#{request.path}|"                # "/example/foo"
  #p request.ip                  # client IP address
  #p request.secure?             # false (would be true over ssl)
  #p request.forwarded?          # true (if running behind a reverse proxy)
  #p request.env                 # raw env hash handed in by Rack
  p "params|#{params}|"
  p "end test printout"
  "Hello 14"
end

get '/fog/:name/in/:place' do
  p "start test printout"
  #t = %w[text/css text/html application/javascript]
  #p request.accept              # ['text/html', '*/*']
  #p request.accept? 'text/xml'  # true
  #p request.preferred_type(t)   # 'text/html'
  p "request.body|#{request.body}|"                # request body sent by the client (see below)
  #p request.scheme              # "http"
  #p request.script_name         # "/example"
  #p request.path_info           # "/foo"
  #p request.port                # 80
  p "request.request_method|#{request.request_method}|"      # "GET"
  #p request.query_string        # ""
  #p request.content_length      # length of request.body
  #p request.media_type          # media offerRaw of request.body
  #p request.host                # "example.com"
  #p request.get?                # true (similar methods for other verbs)
  #p request.form_data?          # false
  #p request["some_param"]       # value of some_param parameter. [] is a shortcut to the params hash.
  #p request.referrer            # the referrer of the client or '/'
  #p request.user_agent          # user agent (used by :agent condition)
  #p request.cookies             # hash of browser cookies
  #p request.xhr?                # is this an ajax request?
  p "request.url|#{request.url}|"                 # "http://example.com/example/foo"
  p "request.path|#{request.path}|"                # "/example/foo"
  #p request.ip                  # client IP address
  #p request.secure?             # false (would be true over ssl)
  #p request.forwarded?          # true (if running behind a reverse proxy)
  #p request.env                 # raw env hash handed in by Rack
  p "params|#{params}|"
  p "end test printout"
  "Hello 15"
end

put '/fog' do
  p "start test printout"
  #t = %w[text/css text/html application/javascript]
  #p request.accept              # ['text/html', '*/*']
  #p request.accept? 'text/xml'  # true
  #p request.preferred_type(t)   # 'text/html'
  p "request.body|#{request.body}|"                # request body sent by the client (see below)
  #p request.scheme              # "http"
  #p request.script_name         # "/example"
  #p request.path_info           # "/foo"
  #p request.port                # 80
  p "request.request_method|#{request.request_method}|"      # "GET"
  #p request.query_string        # ""
  #p request.content_length      # length of request.body
  #p request.media_type          # media offerRaw of request.body
  #p request.host                # "example.com"
  #p request.get?                # true (similar methods for other verbs)
  #p request.form_data?          # false
  #p request["some_param"]       # value of some_param parameter. [] is a shortcut to the params hash.
  #p request.referrer            # the referrer of the client or '/'
  #p request.user_agent          # user agent (used by :agent condition)
  #p request.cookies             # hash of browser cookies
  #p request.xhr?                # is this an ajax request?
  p "request.url|#{request.url}|"                 # "http://example.com/example/foo"
  p "request.path:#{request.path}:"                # "/example/foo"
  #p request.ip                  # client IP address
  #p request.secure?             # false (would be true over ssl)
  #p request.forwarded?          # true (if running behind a reverse proxy)
  #p request.env                 # raw env hash handed in by Rack
  p "params|#{params}|"
  p "end test printout"
  "Hello 16"
end

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


