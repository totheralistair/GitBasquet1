=begin
require 'rack/test'
require_relative '../../src/n12_web_basquetizer'

module AppHelper
  # Rack-Test expects the app method to return a Rack application
  def app
    WebBasquetizer
  end
end

World(Rack::Test::Methods, AppHelper)
=end

