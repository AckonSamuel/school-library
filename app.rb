require 'json'
require_relative 'app_addition'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'

class App
  attr_accessor :rentals, :books, :people

  def initialize
    @books = []
    @rentals = []
    @people = []
    @bookArr = []
    @rentalsArr = []
    @peopleArr = []
  end

  # rubocop:disable Metrics/PerceivedComplexity
  # rubocop:disable Metrics/CyclomaticComplexity: Method has too many lines.

  def list_books
    if @books.empty?
      puts 'No books found'
    else
      @books.each { |book| puts "| Title: #{book.title}, Author: #{book.author}" }
    end
  end

  def list_people
    if @people.empty?
      puts 'No people found'
    else
      @people.each do |person|
        puts "[Student] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" if person.is_a? Student
        puts "[Teacher] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" if person.is_a? Teacher
      end
    end
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]'
    user_input = gets.chomp.to_i
    return unless (1..2).cover? user_input

    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    case user_input
    when 1
      puts 'Has parent permission? [Y/N]: '
      permitt = gets.chomp
      # rubocop:disable Lint/LiteralAsCondition
      permitt = permitt == 'y' || 'Y' || 'n' || 'N' ? true : nil
      permitt = false if permitt == 'n' || 'N'
      # rubocop:enable Lint/LiteralAsCondition
      student = Student.new(age, name, parent_permission: permitt)
      @people << student
      # student.instance_variables.each { |var| @peopleHash[var.to_s.delete("@")] = student.instance_variables_get(var) }
      @peopleArr << student.disintegrate
    when 2
      print 'Specialization: '
      spec = gets.chomp
      teacher = Teacher.new(age, name, spec, parent_permission: true)
      @people << teacher
      @peopleArr << teacher.disintegrate
    end
    puts 'person created successfully'
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
    @bookArr << book.disintegrate
    puts 'Book created successfully'
  end

  def list_rentals_by_book_id
    puts 'Select a book from the following list by number'
    @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
  end

  def list_rentals_for_person
    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def check_if_books_and_people_exist
    if @books.empty?
      puts 'No books found'
      return false
    elsif @people.empty?
      puts 'No people found'
      return false
    end
    true
  end

  def create_rental
    if check_if_books_and_people_exist
      begin
        list_rentals_by_book_id
        book_index = gets.chomp.to_i
        puts # empty line
        list_rentals_for_person
        person_index = gets.chomp.to_i
      rescue StandardError
        puts 'Invalid input, please try again'
        retry
      end
      puts # empty line
      puts 'Input date e.g. 2021-01-01'
      print 'Date: '
      date = gets.chomp
      puts 'Sorry, You input invalid date' unless date.match?(/\d{4}-\d{2}-\d{2}/)
      rental = Rental.new(date, @books[book_index], @people[person_index])
      @rentals << rental
      @rentalsArr << rental.disintegrate
      puts 'Rental created successfully'
    else
      puts 'Cannot create rental because there are no books or people in the app' end
  end

  def list_rentals_by_person_id
    puts # empty line
    print 'ID of person: '
    person_id = gets.chomp.to_i

    is_id_exist = @people.any? { |person| person.id == person_id }
    if is_id_exist
      puts # empty line
      puts "|____________All rentals of person(id: #{person_id})____________|"
      @rentals.each do |rental|
        if rental.person.id == person_id
          puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
        end
      end
    else
      puts 'ID not found'
    end
  end

  def preserve

    foo0 = Foo.new(@peopleArr, @bookArr, @rentalsArr)

    opts = {
      array_nl: "\n",
      object_nl: "\n",
      indent: '  ',
      space_before: ' ',
      space: ' '
    }

    json1 = JSON.generate(foo0, opts)

    puts json1

  end

  def people
    puts "#{@peopleArr}"
  end

  def rentals
    puts "#{@rentals}"
  end

  def books
    puts "#{@books}"
  end

end
# rubocop:enable Metrics/CyclomaticComplexity: Method has too many lines.
# rubocop:enable Metrics/PerceivedComplexity
