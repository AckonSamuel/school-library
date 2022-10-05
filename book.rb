class Book
  attr_accessor :title, :author

  def initialize(title, author)
    @id = Random.rand(1..1000)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(rental)
    @rentals << rental
  end

  def disintegrate
    { 'id' => @id, 'title' => @title, 'author' => @author }
  end

  def id
    @id
  end

  def title
    @title
  end

  def author
    @author
  end

end
