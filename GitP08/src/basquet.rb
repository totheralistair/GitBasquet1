
class Basquet
# ======= CLASS METHODS =======
  def self.aPersistentBasquet
    @@theOneAndOnlyBasquet ||= Basquet.new
  end

  def self.newPersistentBasquetPlease
    @@theOneAndOnlyBasquet = Basquet.new
  end

# ======= INSTANCE METHODS =======
  def initialize
    @contents = Array.new
  end

  def size
    @contents.size
  end

  def zadd(something)    #returns index of thing added
    @contents.push(something).size - 1
  end

  def gimmeAt(index)
    @contents[index]
  end

  def gimmeLast(how_many=1)
    @contents.last(how_many)
  end

end