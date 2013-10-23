# hello_world.rb
require 'rack'
require 'rack/server'

class HelloWorld1
  def response
    [200, {}, ['Hello World'] ]
  end
end

class HelloWorldApp1
  def self.call(env)
    HelloWorld1.new.response
  end
end

#Rack::Server.start :app => HelloWorldApp1

#===========================================
class HelloWorldApp2
  def self.call(env)
    [200, {}, [ "Hello World. You said:  #{env['QUERY_STRING']}" ] ]
  end
end

#Rack::Server.start :app => HelloWorldApp2

#================================================
class EnvInspector
  def self.call(env)
    [200, {}, [ env.inspect] ]
  end
end

#Rack::Server.start :app => EnvInspector

#===========================================
class HelloWorldApp4
  def self.call(env)
    request = Rack::Request.new env
    request.params # contains the union of GET and POST params
    request.xhr?   # requested with AJAX
    request.body   # the incoming request IO stream

    if request.params['message']
      [200, {}, [request.params['message']]]
    else
      [200, {}, ['Say something to me!']]
    end
  end
end

#Rack::Server.start :app => HelloWorldApp4

#===========================================
class HelloWorldApp5
  def self.call(env)
    response = Rack::Response.new
    response.write 'Hello World' # write some content to the body
    response.body = ['Hello World'] # or set it directly
    response['X-Custom-Header'] = 'foo'
    response.set_cookie 'aKey', 'neededValue'
    response.status = 202

    response.finish # return the generated triplet
  end
end

#Rack::Server.start :app => HelloWorldApp5

