require_relative 'basquet'
require_relative 'json_producer'
require_relative 'flat_file_adapter'

class LongJohnSilverFilesinFilesoutJSON
  def initialize
    @basquet = Basquet.new
    @ffa = FlatFileAdapter.new
    @jp = JsonProducer.new
  end

  def gather_inputs
     @basquet_inputs = @ffa.array_from_file
  end

  def add_to_basquet
    @basquet_inputs.each do  |item|
      @basquet.add( item )
    end
  end

  def output_basquet
    @ffa.push_to_file(@jp.to_json(@basquet.gimmeAll))
  end

end