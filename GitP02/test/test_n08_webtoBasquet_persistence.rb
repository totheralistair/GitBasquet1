#C:\Users\Alistair\AlistairCockburn\RubymineProjects\acWithDave1\test\test_n06_rockpaperscissors.rb

require 'test/unit'
require 'rack/test'
require_relative '../src/n08_webbasquet'

  class TestWebAddToBasquet < Test::Unit::TestCase
    include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_00_hello
    get '/'
    assert_equal "hello from persistent webBasquet", last_response.body
  end

  def test_01_add1item_viaGet
    get '/add/item1'
    assert_equal "request to add by GET 'item1'. Added at 0", last_response.body
    get '/getAt/0'
    assert_equal "item1", last_response.body
  end

  def test_02_add2nditem_readBoth
    get '/add/item2'
    assert_equal "request to add by GET 'item2'. Added at 1", last_response.body
    get '/getAt/0'
    assert_equal "item1", last_response.body
    get '/getAt/1'
    assert_equal "item2", last_response.body
  end

  def test_03_add3rditem_viaPOST
    post '/add', "newStuff=item3"
    assert_equal "request to add by POST 'item3'. Added at 2", last_response.body
    get '/getAt/2'
    assert_equal "item3", last_response.body
  end

end

