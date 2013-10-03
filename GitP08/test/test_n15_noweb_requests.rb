require 'rspec/expectations'
require 'test/unit'
require_relative '../src/muffinland_verbs'



class TestWeblessRequestsToBasquet < Test::Unit::TestCase
  def setup
  end

  def teardown
  end


#  def test_00_muffinland_home #THERE is no _home method on ML
#  end

  def test_01_fresh_basquet_is_empty
    muffinland_fresh_DB.should == "New basquet w 0 items."
  end

  def test_02_storing_full_request
    muffinland_fresh_DB.should == "New basquet w 0 items."
    muffinland_addGETRequest("/addGETRequest/broohaha").should == "addGETRequest request stored at 0"
  end

  def test_02b_correct_persistence_of_basquet_across_tests
    muffinland_fresh_DB.should == "New basquet w 0 items."
    muffinland_addGETRequest("/addGETRequest/broohaha").should == "addGETRequest request stored at 0"
    req = Net::HTTP::Get.new('http://bogus.uri')
    req['PATH_INFO']= 'something'
    req.body = 'hi'
    muffinland_addGETRequest(req)
    muffinland_getRequestVerb_at(1).should == "something"
  end

=begin
    get "/addGETRequest/GrimmStories"
        last_response.body.should == "addGETRequest request stored at 1"
    get '/getRequestVerbAt/1'
        last_response.body.should == "/addGETRequest/GrimmStories"
  def test_03_storing_POST_request
    get "/FRESH_DB"; last_response.body.should == "New basquet w 0 items."
    post '/addPOSTRequest', 'acData=oogaPOSTboogo'
        last_response.body.should == "addPOSTRequest request stored at 0"
    get "/getAtRequestDataField/0/acData"
       last_response.body.should == "oogaPOSTboogo"
  end

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

