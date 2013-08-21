
class Basquet
  def initialize
    @contents = Array.new
  end

  def add(something)
    @contents.push(something)
  end

  def gimmeAll
    @contents
  end

  def gimme(how_many=1)
    @contents.last(how_many)
  end

  def size
    @contents.size
  end

end