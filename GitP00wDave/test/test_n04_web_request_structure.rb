require 'test/unit'
require 'rack/test'
require_relative '../src/n04_web_request_structure'

class TestWebIn < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_empty
    get '/'
    assert_equal 'Hello 12', last_response.body
  end

  def test_fog
    get '/fog'
    assert_equal 'Hello 13', last_response.body
  end

  def test_fog_bank
    get '/fog/bank'
    assert_equal 'Hello 14', last_response.body
  end

  def test_FogBankInLondon
    get '/fog/bank/in/london'
    assert_equal 'Hello 15', last_response.body
  end

  def test_put_fog_bank
    put '/fog', "fog=bank"
    assert_equal 'Hello 16', last_response.body
  end

end