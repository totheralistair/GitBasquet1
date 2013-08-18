require "sinatra"

get '/' do
  build_hello_number
end

get '/hello/:whom' do
  build_hello_to_someone( params[:whom] )
end

get '/tell/:whom/to/:what' do
  build_tell_whom_what( params[:whom], params[:what] )
end


def build_hello_number
  $built_response = "Hello 13"
end

def build_hello_to_someone( whom )
  $built_response = "Hello to #{whom}!"
end

def build_tell_whom_what( whom, what)
  $built_response = "Tell #{whom}: #{what} for me !"
end



