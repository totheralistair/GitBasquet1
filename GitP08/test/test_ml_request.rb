require 'rspec/expectations'
require 'test/unit'
require_relative '../src/ml_request'


class TestBasquet < Test::Unit::TestCase

  def test_01_new_
    r= MLRequest.new("st")
  end

end