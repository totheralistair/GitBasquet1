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
    last_response.body.should == "New basquet w 0 items in it."
  end

  def add_1_item_puts_it_at_0
    get "/FRESH_DB"
      last_response.body.should == "New basquet w 0 items in it."
    get "/addTextImmediate/item1"
      last_response.body.should == "GET/addTextImmediate requested. I put :'item1': at 0"
    get '/getat/0'
      last_response.body.should == 'item1'
  end

  def test_add_2_items_puts_it_at_1
    get "/FRESH_DB"
      last_response.body.should == "New basquet w 0 items in it."
    get "/addTextImmediate/new_1st_item"
      last_response.body.should == "GET/addTextImmediate requested. I put :new_1st_item: at 0"
    get "/addTextImmediate/item2"
      last_response.body.should == "GET/addTextImmediate requested. I put :item2: at 1"
    get '/getat/0'
      last_response.body.should == 'new_1st_item'
    get '/getat/1'
      last_response.body.should == 'item2'
  end

    def test_storing_full_request
      get "/FRESH_DB"
        last_response.body.should == "New basquet w 0 items in it."
      get "/addRequest/broohaha"
        last_response.body.should == "addRequest request was stored at location 0"
      get '/getRequest-VerbAt/0'
        last_response.body.should == "/addRequest/broohaha"
      get "/addRequest/GrimmStories"
        last_response.body.should == "addRequest request was stored at location 1"
      get '/getRequest-VerbAt/1'
        last_response.body.should == "/addRequest/GrimmStories"
    end

    def test_storing_POSt_request
      get "/FRESH_DB"
        last_response.body.should == "New basquet w 0 items in it."
      post '/addRequest', 'acData=oogaPOSTboogo'
        last_response.body.should == "addRequest request was stored at location 0"
      get "/getRequest-DataFieldAt/acData/0"
       last_response.body.should == "oogaPOSTboogo"
    end

end

