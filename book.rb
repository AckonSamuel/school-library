class Book
  attr_accessor :title, :author

  def initialize(title, author)
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
end
