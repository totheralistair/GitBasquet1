require 'rspec/expectations'
require 'test/unit'
require_relative '../src/basquet'


class TestBasquet < Test::Unit::TestCase
  def setup
  end

  def teardown
  end

  def test_01_new_basquet_is_empty
    b = Basquet.new
    b.size.should == 0
  end

  def test_02_bad_gimme_returns_nil
    b = Basquet.new
    b.gimmeAt(1).should == nil
    b.gimmeAt(-1).should == nil
  end

  def test_03_zadd_returns_index
    b = Basquet.new
    b.zadd( 'alistair').should == 0
    b.zadd( 'Cockburn').should == 1
    b.gimmeAt(0).should == 'alistair'
    b.gimmeAt(1).should == 'Cockburn'
  end


  def test_04_gimme_from_nothing_is_empty_array
    b = Basquet.new
    b.gimmeLast(1).should == []
    b.zadd( 'alistair')
    b.zadd( 'alistai')
    b.gimmeLast(1).should == ['alistai']
    b.gimmeLast(2).should == ['alistair','alistai']
    b.gimmeLast(3).should == ['alistair','alistai']
  end


  def test_05_gimme_alone_gives_latest_addition
  b = Basquet.new
  b.zadd( 'alistair')
  b.zadd( 'alistai')
  b.gimmeLast.should == ['alistai']
  end

end