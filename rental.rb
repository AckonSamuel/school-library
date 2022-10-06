class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(date, book, person, person_index, book_index)
    @date = date

    @book = book
    @book&.add_rental(self)

    @person = person
    @person&.add_rental(self)

    @person_index = person_index

    @book_index = book_index
  end

  def disintegrate
    { 'date' => @date, 'person_index' => @person_index, 'book_index' => @book_index }
  end
end
