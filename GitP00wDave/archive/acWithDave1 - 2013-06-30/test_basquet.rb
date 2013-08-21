require 'test/unit'
require_relative 'basquet'
require_relative 'json_producer'
require_relative 'flat_file_adapter'
require_relative 'flat_filing_basquets'


class TestBasquet < Test::Unit::TestCase
  def setup
  end

  def teardown
  end

  def test_new_basquet_is_empty
    b = Basquet.new
    assert_equal( 0, b.size)

  end

  def test_gimme_from_nothing_is_empty_array
    b = Basquet.new
    assert_equal( [], b.gimme(1) )
    b.add( 'alistair')
    b.add( 'alistai')
    assert_equal( ['alistair','alistai'], b.gimme(3) )
    assert_equal( ['alistair','alistai'], b.gimmeAll )
  end

  def test_gimme_alone_gives_latest_addition
  b = Basquet.new
  b.add( 'alistair')
  b.add( 'alistai')
  assert_equal(['alistai'], b.gimme)
  end

  def test_gimmeJSON_empty_is_braces
    b = Basquet.new
    assert_equal( '[]', JsonProducer.new.to_json(b.gimme))
  end

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

=begin  def test_input_file_outputs_basquet_to_file_as_json
    basquet_inputs = FlatFileAdapter.new.array_from_file
    b = Basquet.new
    basquet_inputs.each do  |item|
      b.add( item )
    end
    FlatFileAdapter.new.push_to_file(JsonProducer.new.to_json(b.gimmeAll))
  end
=end

  def test_flat_filing_basquet_gathers_and_stores
    j = FlatFilingBasquets.new
    j.gather_inputs
    j.add_to_basquet
    j.output_basquet
  end

end