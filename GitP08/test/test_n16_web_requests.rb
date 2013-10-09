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

  def test_03_can_extract_data_field
    get "/FRESH_DB"; last_response.body.should == "0"
    post '/post', 'acData=oogaPOSTboogo'; last_response.body.should == "0"
    get "/dataforat/acData/0"; last_response.body.should == "oogaPOSTboogo"
  end

  def test_cookie_gets_added_if_it_does_not_exist
    #  SEE MOM, NO COOKIE!
    get "/FRESH_DB"; last_response.body.should == "0"
    post '/post'; last_response.body.should == "0"
    last_response.original_headers["Set-Cookie"].should == "user_session=user+123"
  end

  def test_cookie_found_if_it_already_exists
    set_cookie "user_session=user 567"
    get "/FRESH_DB";  last_response.body.should == "0"
    get '/get/whatever'; last_response.body.should == "0"
    last_request.cookies.should  == { "user_session" => "user 567"}
  end


end

