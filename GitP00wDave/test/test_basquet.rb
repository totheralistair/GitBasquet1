require 'test/unit'
require_relative '../src/basquet'
require_relative '../src/json_producer'
require_relative '../src/flat_file_adapter'
require_relative '../src/long_john_silver_filesin_filesoutJSON'


class TestBasquet < Test::Unit::TestCase
  def setup
  end

  def teardown
  end

  def test_new_basquet_is_empty
    b = Basquet.new
    assert_equal( 0, b.size)

  end

  def test_add_returns_index
    b = Basquet.new
    index1 = b.add( 'alistair')
    assert_equal( 0, index1 )
    index2 = b.add( 'Cockburn')
    assert_equal( 1, index2 )
    assert_equal( 'alistair', b.gimme(index1) )
    assert_equal( 'Cockburn', b.gimme(index2) )
  end


  def test_gimme_from_nothing_is_empty_array
    b = Basquet.new
    assert_equal( [], b.gimmeLast(1) )
    b.add( 'alistair')
    b.add( 'alistai')
    assert_equal( ['alistair','alistai'], b.gimmeLast(3) )
    assert_equal( ['alistair','alistai'], b.gimmeAll )
  end





  def test_gimme_alone_gives_latest_addition
  b = Basquet.new
  b.add( 'alistair')
  b.add( 'alistai')
  assert_equal(['alistai'], b.gimmeLast)
  end

  def test_gimmeJSON_empty_is_braces
    b = Basquet.new
    assert_equal( '[]', JsonProducer.new.to_json(b.gimmeLast))
  end

  def test_Json_to_file
    b = Basquet.new
    b.add( 'Aalistair')
    b.add( 'Alistai')
    FlatFileAdapter.new.push_to_file(JsonProducer.new.to_json(b.gimmeAll))
  end

  def test_input_file_reads_as_string
    exp = "first line\nsecond line\nnot yet done\n"
    act = FlatFileAdapter.new.string_from_file
    assert_equal( exp, act )
  end

  def test_input_file_reads_as_array
    exp = ["first line", "second line", "not yet done" ]
    act = FlatFileAdapter.new.array_from_file
    assert_equal( exp, act )
  end

  def test_flat_filing_basquet_gathers_and_stores
    j = LongJohnSilverFilesinFilesoutJSON.new
    j.gather_inputs
    j.add_to_basquet
    j.output_basquet
  end

=begin def test_input_file_outputs_basquet_to_file_as_json
    basquet_inputs = FlatFileAdapter.new.array_from_file
    b = Basquet.new
    basquet_inputs.each do  |item|
      b.add( item )
    end
    FlatFileAdapter.new.push_to_file(JsonProducer.new.to_json(b.gimmeAll))
  end
=end

=begin  def test_gimmeJSON_ofA_is_quoteAquote
    b = Basquet.new
    b.add('Alistair')
    assert_equal( '["Alistair"]', JsonProducer.new.to_json(b.gimme))
  end

  def test_gimmeJSON_AlistairAlistai
    b = Basquet.new
    b.add( 'alistair')
    b.add( 'Alistai')
    assert_equal( '["alistair","Alistai"]', b.gimmeJSON(2))
    assert_equal( '["alistair","Alistai"]', b.gimmeAllJSON)
  end
=end

end