require 'rspec/expectations'
require 'test/unit'
require_relative '../src/basquet'


class TestBasquet < Test::Unit::TestCase
  def setup
  end

  def teardown
  end

  def test_new_basquet_is_empty
    b = WebMuffinBasquet.new
    b.size.should == 0
  end

  def test_zadd_returns_index
    b = WebMuffinBasquet.new
    b.zadd( 'alistair').should == 0
    b.zadd( 'Cockburn').should == 1
    b.gimmeAt(0).should == 'alistair'
    b.gimmeAt(1).should == 'Cockburn'
  end


  def test_gimme_from_nothing_is_empty_array
    b = WebMuffinBasquet.new
    b.gimmeLast(1).should == []
    b.zadd( 'alistair')
    b.zadd( 'alistai')
    b.gimmeLast(1).should == ['alistai']
    b.gimmeLast(2).should == ['alistair','alistai']
    b.gimmeLast(3).should == ['alistair','alistai']
    b.gimmeAll.should == ['alistair','alistai']
  end


  def test_gimme_alone_gives_latest_addition
  b = WebMuffinBasquet.new
  b.zadd( 'alistair')
  b.zadd( 'alistai')
  b.gimmeLast.should == ['alistai']
  end

end