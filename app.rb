require 'json'
require_relative 'app_addition'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'

# rubocop:disable Metrics/PerceivedComplexity
# rubocop:disable Metrics/CyclomaticComplexity: Method has too many lines.
# rubocop:disable Metrics/MethodLength
# rubocop:disable Layout/LineLength

class App
  attr_accessor :rentals, :books, :people

  def initialize
    @books = []
    @rentals = []
    @people = []
    @book_arr = []
    @rentals_arr = []
    @people_arr = []
    people_load
    book_load
    rental_load
  end

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
      @people_arr << student.disintegrate
    when 2
      print 'Specialization: '
      spec = gets.chomp
      teacher = Teacher.new(age, name, spec, parent_permission: true)
      @people << teacher
      @people_arr << teacher.disintegrate
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
    @book_arr << book.disintegrate
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
      rental = Rental.new(date, @books[book_index], @people[person_index], person_index, book_index)
      @rentals << rental
      @rentals_arr << rental.disintegrate
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
    person = Foo.new('people', @people_arr)
    book = Foo.new('book', @book_arr)
    rental = Foo.new('rental', @rentals_arr)

    File.write('./books.json', JSON.dump(book))
    File.write('./person.json', JSON.dump(person))
    File.write('./rental.json', JSON.dump(rental))
  end

  def people_load
    file_p = File.read('./person.json')
    return unless file_p.length.positive?

    fresh = JSON.parse(file_p)
    fresh['data'].each do |person|
      if person['class'] == 'Student'
        student = Student.new(person['age'], person['name'], parent_permission: person['parent_permission'])
        @people << student
      end
      next unless person['class'] == 'Teacher'

      teacher = Teacher.new(person['age'], person['name'], person['name'],
                            parent_permission: person['parent_permission'])
      @people << teacher
    end
  end

  def book_load
    file_b = File.read('./books.json')
    return unless file_b.length.positive?
    bookss = JSON.parse(file_b)
    bookss['data'].each do |book|
      boo = Book.new(book['title'], book['author'])
      @books << boo
    end
  end

  def compare

  end

  def rental_load
    file_r = File.read('./rental.json')
    return unless file_r.length.positive?

    rents = JSON.parse(file_r)
    rents['data'].each do |rent|
      ren = Rental.new(rent['date'], @books[rent['book_index']], @people[rent['person_index']], rent['person_index'], rent['book_index'])
      @rentals << ren
    end

  end

  # rentals_file = File.read('./rentals.json')
  #   return unless rentals_file.length.positive?

  #   new_rentals = JSON.parse(rentals_file)
  #   new_rentals.each do |r|
  #     rental = Rental.new(@books[r['book_index']], @people[r['person_index']])
  #     rentals.push(rental)
  #   end

end
# rubocop:enable Layout/LineLength
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/CyclomaticComplexity: Method has too many lines.
# rubocop:enable Metrics/PerceivedComplexity
