class FlatFileAdapter

  def push_to_file(stuff)
    filepath = "C:/Users/Alistair/AlistairCockburn/Ruby/Alistair/AC w DaveNgeo1/"
    filename = "BasquetContents.txt"
    File.open( filepath + filename, "w") do |file|
      file.puts stuff
      end
  end

  def string_from_file
    filepath = "C:/Users/Alistair/AlistairCockburn/Ruby/Alistair/AC w DaveNgeo1/"
    filename = "BasquetInput.txt"
    IO.read( filepath + filename )
  end

  def array_from_file
    filepath = "C:/Users/Alistair/AlistairCockburn/Ruby/Alistair/AC w DaveNgeo1/"
    filename = "BasquetInput.txt"
    result = Array.new
    IO.foreach( filepath + filename ){
      |line|
      result.push(line.strip)
    }
    result
  end


end