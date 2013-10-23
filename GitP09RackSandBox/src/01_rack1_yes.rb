# http://ruby.about.com/od/rack/a/Using-Rack.htm

require 'rack'

# simplest rack program ever:
class HelloWorld
  def call(env)
    return [
        200, # HTTP status code
        {'Content-Type' => 'text/html'}, # response headers hash
        ["Hello world!"]] # body
  end
end

Rack::Handler::WEBrick.run(
    HelloWorld.new,
    :Port => 9000
)

#holy moly this works