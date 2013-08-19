#require File.join(File.dirname(__FILE__), '..', '..', 'n11_fruit_app')
require_relative '../../src/n11_fruit_app'
require 'rack/test'

module AppHelper
  # Rack-Test expects the app method to return a Rack application
  def app
    FruitApp
  end
end

World(Rack::Test::Methods, AppHelper)

