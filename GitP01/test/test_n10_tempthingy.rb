require 'test/unit'
require '..\src\n10_tempthingy'

class MyTest < Test::Unit::TestCase


  def test_hiho
    t = N10Tempthingy.new
    out = t.say_hiho
    assert_equal( "hiho", out)
  end

end