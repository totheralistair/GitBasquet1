
class Basquet

  def self.newPersistentBasquetPlease
    @@theOneAndOnlyBasquet = Basquet.new
  end

  def self.aPersistentBasquet
    @@theOneAndOnlyBasquet ||= Basquet.new
  end

  def initialize
    @contents = Array.new
  end

  def zadd(something)    #returns index of thing added
    @contents.push(something).size - 1
  end

  def gimmeAt(index)
    @contents[index]
  end

  def gimmeAll
    @contents
  end

  def gimmeLast(how_many=1)
    @contents.last(how_many)
  end

  def size
    @contents.size
  end

end