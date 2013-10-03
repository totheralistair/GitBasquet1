require 'rspec/expectations'
require 'test/unit'
require 'rack/test'
require_relative '../src/n16_req_thru_sinatra'

class TestRequestsToBasquet < Test::Unit::TestCase
    include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_00_hello
    get '/'; last_response.body.should == "Welcome to Muffinland"
  end

  def test_01_fresh_basquet_is_empty
    get "/FRESH_DB"; last_response.body.should == "0"
  end

  def test_02_storing_full_request
    get "/FRESH_DB"; last_response.body.should == "0"
    get "/get/broohaha"; last_response.body.should == "0"
    post '/post', 'acData=oogaPOSTboogo'; last_response.body.should == "1"
  end

  def test_03_can_extract_path
    get "/FRESH_DB"; last_response.body.should == "0"
    get "/get/broohaha"; last_response.body.should == "0"
    get '/path/0'; last_response.body.should == "/get/broohaha"
  end


end

