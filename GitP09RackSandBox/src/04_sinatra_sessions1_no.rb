#===========================================
# Sinatra sessions, from  http://spring493.deliciousrobots.com/page/session
# too complicated for now

#===========================================
# http://rubylearning.com/blog/2009/09/30/cookie-based-sessions-in-sinatra/
#
=begin
require 'rubygems'
require 'sinatra'

enable :sessions

get '/' do
  session["value"] ||= "Hello world!"
  "The cookie you've created contains the value: #{session["value"]}"
end
=end

# run this code, open browser to localhost:4567 and see!

#=================================================================
=begin
require 'rubygems'
require 'sinatra'
require 'haml'

enable :sessions

get '/' do
  session["user"] ||= nil
  haml :index
end

get '/introduction' do
  haml :introduction
end

post '/introduction' do
  session["user"] = params[:name]
  redirect '/'
end

get '/bye' do
  session["user"] = nil
  haml :bye
end
=end

#====================================
require 'sinatra'
enable :sessions


get '/' do
  erb :index
end

