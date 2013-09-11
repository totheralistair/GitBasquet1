require 'rspec/expectations'
require 'test/unit'
require 'rack/test'
require_relative '../src/n14_req_headers01'

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

  def test_add_1_item_puts_it_at_0
    get "/FRESH_DB"
      last_response.body.should == "New basquet w 0 items."
    get "/addImmediate/item1"
      last_response.body.should == "GET/addImmediate of :item1: at 0"
    get '/getAt/0'
      last_response.body.should == 'item1'
  end

  def test_add_2_items_puts_it_at_1
    get "/FRESH_DB"
      last_response.body.should == "New basquet w 0 items."
    get "/addImmediate/new_1st_item"
      last_response.body.should == "GET/addImmediate of :new_1st_item: at 0"
    get "/addImmediate/item2"
      last_response.body.should == "GET/addImmediate of :item2: at 1"
    get '/getAt/0'
      last_response.body.should == 'new_1st_item'
    get '/getAt/1'
      last_response.body.should == 'item2'
  end

    def test_storing_full_request
      get "/FRESH_DB"
        last_response.body.should == "New basquet w 0 items."
      get "/addGETRequest/broohaha"
        last_response.body.should == "addGETRequest request stored at 0"
      get '/getRequestVerbAt/0'
        last_response.body.should == "/addGETRequest/broohaha"
      get "/addGETRequest/GrimmStories"
        last_response.body.should == "addGETRequest request stored at 1"
      get '/getRequestVerbAt/1'
        last_response.body.should == "/addGETRequest/GrimmStories"
    end

    def test_storing_POST_request
      get "/FRESH_DB"
        last_response.body.should == "New basquet w 0 items."
      post '/addPOSTRequest', 'acData=oogaPOSTboogo'
        last_response.body.should == "addPOSTRequest request stored at 0"
      get "/getAtRequestDataField/0/acData"
       last_response.body.should == "oogaPOSTboogo"
    end

end

