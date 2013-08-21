require 'test/unit'
require 'rack/test'
require_relative '../src/n02_web_get_respond'

class TestWebIn2 < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_my_default
    get '/'
    assert_equal 'Hello 13', $built_response
  end

  def test_1_param
    get '/hello/Mike'
    assert_equal 'Hello to Mike!', $built_response
  end

end