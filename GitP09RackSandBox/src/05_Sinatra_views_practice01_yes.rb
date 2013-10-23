# from Sinatra book example 2-15 onward

require   'sinatra'

#========================================
# learning where to put the view subfolder
# and that erb wants the file name as a symbol
get '/view01' do
  erb :view01_justaview
end

#========================================
# learning to pass a variable into the view
get '/view02' do
  testVarNoAt = 'testVarNo@ does not work, needs instance var'
  @testVarWithAt = '@testVarWithAt works'
  erb :view02_withavar
end

#========================================
# learning to use iterator in the view
get '/view03' do
  @testarray = ['show1', 'show2', 'show3']
  erb :view03_withaniterator
end

#========================================
# learning handling 404 with "not_found" route
not_found do
  @busted_path = request.env["PATH_INFO"]
  erb :view_404
end

#========================================
# experimenting w 500 error handling
configure do
  set :show_exceptions, false
end

get '/force500error' do
  0 / 0
end

error do
  erb :view_500
end

#========================================
# learning to set HTML headers
get '/customheader' do
  headers "X-Custom-Value" => "sample custom HTTP header."
  'Custom header set'
end

#========================================
# dump the request object
get '/showrequest' do
  erb :view06_showrequest
end

#========================================
# sessions up next! p. 42
configure do
  enable :sessions
  set :session_secret, 'alistair'
end

get '/setsession' do
  session[:s_key] = Time.now
  out = Time.now.to_s
end

get '/getsession' do
  "Session value for 'key' is #{session[:s_key]}"
end

get '/endsession' do
  session.clear
  redirect '/getsession'
end

#========================================
# trying cookies (again)
get '/setACsessioncookie' do
  response.set_cookie("acsessionstart", :value=>Time.now.to_s, :path=>'/' )
  "cookie set. <a href='readACsessioncookie'>peek at the it</a> "
end

get '/readACsessioncookie' do
  "acsessionstart cookie value= #{ request.cookies['acsessionstart']}"
end

get '/deleteACsessioncookie' do
  response.delete_cookie "acsessionstart"
  "see if it's deleted. <a href='readACsessioncookie'>peek at the it</a> "
end
#cool beans, all that works!


