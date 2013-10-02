require 'rspec/expectations'
require 'test/unit'
require 'rack/test'
require_relative '../src/n14_req_headers_02'

class TestRequestsToBasquet < Test::Unit::TestCase
    include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_00_hello
    get '/'
      last_response.body.should == "Welcome to my iittle toy Basquet"
  end

  def test_01_fresh_basquet_is_empty
    get "/FRESH_DB"
      last_response.body.should == "New basquet w 0 items."
  end

    def test_02_storing_full_request
      get "/FRESH_DB"; last_response.body.should == "New basquet w 0 items."
      get "/addGETRequest/broohaha"
      last_response.body.should == "addGETRequest request stored at 0"
    end

    def test_02b_correct_persistence_of_basquet_across_tests
      get "/FRESH_DB"; last_response.body.should == "New basquet w 0 items."
      get "/addGETRequest/broohaha"
      last_response.body.should == "addGETRequest request stored at 0"
    get '/getRequestVerbAt/0'
        last_response.body.should == "/addGETRequest/broohaha"
    get "/addGETRequest/GrimmStories"
        last_response.body.should == "addGETRequest request stored at 1"
    get '/getRequestVerbAt/1'
        last_response.body.should == "/addGETRequest/GrimmStories"
    end

  def test_03_storing_POST_request
    get "/FRESH_DB"; last_response.body.should == "New basquet w 0 items."
    post '/addPOSTRequest', 'acData=oogaPOSTboogo'
        last_response.body.should == "addPOSTRequest request stored at 0"
    get "/getAtRequestDataField/0/acData"
       last_response.body.should == "oogaPOSTboogo"
  end

=begin
  def test_cookie_gets_added_if_it_does_not_exist
    #  SEE MOM, NO COOKIE!
    get "/FRESH_DB"; last_response.body.should == "New basquet w 0 items."
    post '/addPOSTRequest', 'acData=oogaPOSTboogo'
        last_response.body.should == "addPOSTRequest request stored at 0"
        last_response.original_headers["Set-Cookie"].should == "user_session=user+123"
    end

  def test_cookie_found_if_it_already_exists
    set_cookie "user_session=user 567"
    get "/FRESH_DB";  last_response.body.should == "New basquet w 0 items."
    post '/addPOSTRequest', 'acData=oogaPOSTboogo'; last_response.body.should == "addPOSTRequest request stored at 0"
        last_request.cookies.should  == { "user_session" => "user 567"}
  end

  def test_cookie_found_from_previous_request_and_none_returned_in_response
    # no cookie setting
    get "/FRESH_DB";  last_response.body.should == "New basquet w 0 items."
    post '/addPOSTRequest', 'acData=oogaPOSTboogo'; last_response.body.should == "addPOSTRequest request stored at 0"
        last_response.original_headers["Set-Cookie"].should == "user_session=user+123"
    get "/getAtRequestDataField/0/acData"; last_response.body.should == "oogaPOSTboogo"
        last_request.cookies.should  == { "user_session" => "user 123"}
        last_response.original_headers["Set-Cookie"].should == nil
  end

      #puts last_request.inspect
      #puts last_response.inspect

=end

end

