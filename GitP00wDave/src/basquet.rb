
class Basquet
  def initialize
    @contents = Array.new
  end

  def add(something)    #returns index of thing added
    @contents.push(something)
    @contents.size - 1
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