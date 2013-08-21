require 'test/unit'
require 'rack/test'
require_relative '../src/n06_Sinatra slesson 2 rock paper scissors'

class Testrockpaperscissors < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_my_default
    get '/'
    assert_equal "Let's play rock, paper, scissors!\n\ruse the URL .../offer/rock (or paper or scissors)\n\rLet's go!\n\r", $built_response
  end

  def test_post
    #post("http://localhost:4567/", [], env.merge(:method => "PUT", :params => params), {})
    post '/'
    assert_equal "there's your POST!\n", $built_response
  end

  def test_postwData
    post '/wfoo', "foo=boo"
    assert_equal "hey here's your foo POST! with :boo:.", $built_response
  end


  def test_1_param
    get '/offer/rock'
    assert_equal "You offered: rock ... I chose: paper.\nI win!", $built_response
  end

  def test_rps_postRock
    post '/rockscissorsspaper', " offer=rock"
    assert_equal "You:rock, me:paper. I win!", $built_response
  end


=begin  def test_2separated_params
    get '/tell/Mike/to/get%20a%20haircut'
    assert_equal 'Tell Mike: get a haircut for me !', $built_response
  end
=end


end

