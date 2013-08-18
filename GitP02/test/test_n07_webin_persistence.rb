require 'test/unit'
require 'rack/test'
require_relative '../src/n07_webcount'

class TestWebAddToBasquet < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_0to1to2
    get '/addImmediate/item1'
    assert_equal "T1 0->1, in addImmediate: count was 0, count now is 1. ", "T1 0->1, #{last_response.body}"
    get '/getAt/0'
    assert_equal "T1 1->2, in getAt: count was 1, count now is 2", "T1 1->2, #{last_response.body}"
  end

  def test_2to3to4
    get '/addImmediate/item1'
    assert_equal "T2 2->3 in addImmediate: count was 2, count now is 3. ", "T2 2->3 #{last_response.body}"
    get '/getAt/0'
    assert_equal "T2 3->4, in getAt: count was 3, count now is 4", "T2 3->4 #{last_response.body}"
  end

end

